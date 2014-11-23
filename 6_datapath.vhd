library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity datapath_6 is
    port(
        RegWr, RegDst, Clk, MemWr, MemtoReg, ALUSrc, ExtOp : in std_logic;
        ALUCtr: in std_logic_vector (3 downto 0);
        Rd, Rt, Rs: in std_logic_vector (4 downto 0);
        imm16: in std_logic_vector (15 downto 0);
        Equal, ovf, cout: out std_logic
        );
end datapath_6;

architecture structural of datapath_6 is

    component extender is
        port(
            ExtOp: in std_logic;
            imm16: in std_logic_vector ( 15 downto 0);
            extended_output: out std_logic_vector ( 31 downto 0)
            );
    end component;

    component sram	is
    generic(
mem_file : string
  );
  port (
cs	 : in	std_logic;
oe	 :	in	std_logic;
we	 :	in	std_logic;
addr  : in	std_logic_vector(31 downto 0);
din	 :	in	std_logic_vector(31 downto 0);
dout  :	out std_logic_vector(31 downto 0)
  );
   end component;
                   
    component alu is 
     port(
       ctrl: in std_logic_vector (3 downto 0);
       A : in std_logic_vector(31 downto 0);
       B: in std_logic_vector ( 31 downto 0);
       cout: out std_logic; 
       ovf: out std_logic; 
       ze: out std_logic;
       R: out std_logic_vector(31 downto 0)
       );
    end component; 
    
    component reg_32 is
    
      port (
        clk   : in std_logic;
        regwr        : in  std_logic;
        RegDst : in std_logic; 
        rs : in std_logic_vector(4 downto 0);
        rt : in std_logic_vector(4 downto 0);
        rd : in std_logic_vector(4 downto 0);
        input	: in std_logic_vector(31 downto 0);
        A   : out std_logic_vector(31 downto 0);
        B  	: out std_logic_vector(31 downto 0)
      );
    end component;

    component mux_32 is
      port (
   sel   : in  std_logic;
   src0  : in  std_logic_vector(31 downto 0);
   src1  : in  std_logic_vector(31 downto 0);
   z	   : out std_logic_vector(31 downto 0)
      );
    end component;
   
   component datamem is
       port (
           clk : in std_logic;
           MemWr : in std_logic; 
           ALU_Output : in std_logic_vector ( 31 downto 0);
           busB_in   : in std_logic_vector ( 31 downto 0);
           Data_Out : out std_logic_vector ( 31 downto 0)
           );
   end component;
 
   signal busA, busB, busW, busW_out, busB_In, imm_extended, Data_Out, ALU_Output : std_logic_vector (31 downto 0);
   
   begin 
   
   Register_Memory: reg_32 port map ( clk, RegWr, RegDst, Rs, Rt, Rd, busW, busA, busB);
   
   extender_datapath: extender port map ( ExtOp, imm16, imm_extended);
   
   input_B_selector_mux: mux_32 port map ( ALUSrc, busB, imm_extended, busB_In);
   
   alu_map: alu port map ( ALUctr, busA, busB_In, cout, ovf, Equal, ALU_Output);
  
   Data_Memory:  	datamem	port map (clk, MemWr, ALU_Output, busB, Data_Out);
 	 
   Mem_to_reg_mux: mux_32 port map ( MemtoReg, ALU_Output, Data_Out, busW);

end structural; 