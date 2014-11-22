library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;


entity alu is 
   port(
       ctrl: in std_logic_vector (3 downto 0);
       A : in std_logic_vector(31 downto 0);
       B: in std_logic_vector ( 31 downto 0);
       cout: out std_logic; 
       ovf: out std_logic; 
       ze: out std_logic;
       R: out std_logic_vector(31 downto 0)
       );
end alu; 

architecture structural of alu is 

   component full_adder is
              port (
                  A : in std_logic;
                  B : in std_logic;
                  Cin : in std_logic;
                  Sum : out std_logic;
                  Cout : out std_logic 
                  );
   end component;
   
   component mux_4 is
     port (
	   sel0	  : in	std_logic;
	   sel1   : in std_logic;
	   src0  :	in	std_logic;
	   src1  :	in	std_logic;
	   src2  : in std_logic;
	   src3  : in std_logic;
	   z	  : out std_logic
     );
   end component;
   
      component mux is
        port (
	      sel	  : in	std_logic;
	      src0  :	in	std_logic;
	      src1  :	in	std_logic;
	      z	  : out std_logic
        );
      end component;
   
    component mux_32 is
      port (
	    sel   : in  std_logic;
	    src0  : in  std_logic_vector(31 downto 0);
	    src1  : in  std_logic_vector(31 downto 0);
	    z	    : out std_logic_vector(31 downto 0)
      );
    end component;
   
   component one_bit_alu is 
      port( 
          ctrl0: in std_logic;
          ctrl1: in std_logic;
          A: in std_logic;
          B: in std_logic;
          Cin : in std_logic;
          Cout: out std_logic;
          R: out std_logic);
   end component;
   
   component sll_32 is 
      port(
           a : in std_logic_vector(31 downto 0);
           b : in std_logic_vector(4 downto 0);
           z : out std_logic_vector(31 downto 0)
           );
   end component;
   
   signal overflow, zero, set_slt, set_sltu, sign_bit_comp : std_logic;
   signal sll_shift: std_logic_vector ( 4 downto 0);
   signal carry, alu_result, sll_result, slt_result, sltu_result, alu_sll_sig, slt_sltu_sig, OP, or_zero: std_logic_vector(31 downto 0);
   
   begin
       
       -- ALU output is alu_result
       
    alu_g32: for i in 0 to 31 generate
    begin

              alu_0: if i = 0 generate
              begin 
              alu_implementation: one_bit_alu port map (ctrl(0), ctrl(1), A(i), B(i), ctrl(0), carry(i), alu_result(i)); 
          end generate alu_0; 
          
              alu_n: if ((i>0) and (i<32)) generate 
              begin
              alu_implementation: one_bit_alu port map (ctrl(0), ctrl(1), A(i), B(i), carry(i-1), carry(i), alu_result(i));
      end generate alu_n;
      
     end generate alu_g32; 
      
      --Carry Out 
      cout <= carry(31);
      
      --Zero will be NOR of the output. 
      
     or32: for i in 0 to 31 generate
     begin
 
               or_0: if i = 0 generate
               begin 
               zero_implementation: or_gate port map (OP(i), OP(i+1), or_zero(i)); 
           end generate or_0; 
           
               or_n: if ((i>0) and (i<31)) generate 
               begin
               zero_implementation: or_gate port map (or_zero(i-1), OP(i+1), or_zero(i));
       end generate or_n;
          
      end generate or32;    
      zero_inv: not_gate port map (or_zero(30), or_zero(31));
      ze <= or_zero(31);

      --Overflow
      overflow_xor: xor_gate port map (carry(31), carry(30), overflow);
      ovf <= overflow; 
      
      
      --sll output is in sll_result
      sll_shift <= B(4 downto 0);
      sll_shifter: sll_32 port map (A, sll_shift, sll_result);  
      
      
      --slt output is '0'*31 & set_slt
      
      not_sign: not_gate port map (alu_result(31), sign_bit_comp);    
      
      slt_mux: mux port map (overflow, alu_result(31), sign_bit_comp, set_slt);
      
      slt_result <=  "0000000000000000000000000000000" & set_slt;
      
      
      --sltu output is '0'*31 & set_sltu
      
      not_sltu: not_gate port map ( carry(31), set_sltu);
      sltu_result <= "0000000000000000000000000000000" & set_sltu;
      
      --We could just use a 2 to 1 mux to select between set_slt and set_sltu and append the output of that mux to 31 zeros. 
      
      -- sll_result, alu_result, slt_result, sltu_result need to be multiplexed to the output. 
      
      alu_sll_mux0: mux_32 port map (ctrl(2), alu_result, sll_result, alu_sll_sig);
      slt_sltu_mux1: mux_32 port map (ctrl(2), slt_result, sltu_result, slt_sltu_sig);
      alu_mux2: mux_32 port map (ctrl(3), alu_sll_sig, slt_sltu_sig, OP );
      
      R <= OP ;
      
end structural ;

      
               
       
       
          
    
        