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
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
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
   
   component mux_5_S is
    port (
	    sel	  : in	std_logic;
	    src0  :	in	std_logic_vector (4 downto 0);
	    src1  :	in	std_logic_vector (4 downto 0);
	    z	  : out std_logic_vector ( 4 downto 0)
        );
    end component;
    
    component reg_32 is
    
      port (
        regwr        : in  std_logic;
        rw 		 : in std_logic_vector(4 downto 0);
        ra 		 : in std_logic_vector(4 downto 0);
        rb 		 : in std_logic_vector(4 downto 0);
        input	 : in std_logic_vector(31 downto 0);
        A   	 : out std_logic_vector(31 downto 0);
        B  		 : out std_logic_vector(31 downto 0)
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
    
    component sync_s is
	    port (
		    clk: 	in std_logic;
		    busW_in: in std_logic_vector (31 downto 0);
          busW_out: out std_logic_vector (31 downto 0)
	         );
    end component;
   
   signal AND_RegWr, AND_MemWr: std_logic;
   signal Rw: std_logic_vector ( 4 downto 0);
   signal busA, busB, busW, busW_out, busB_In, imm_extended, Data_Out, ALU_Output : std_logic_vector (31 downto 0);
   
   begin 
   

   syncreg: sync_s port map (clk, busW, busW_out);
   
   Gated_RegWr: and_gate port map(RegWr, clk, AND_RegWr);

   Gated_MemWr: and_gate port map(MemWr, clk, AND_MemWr);
   
--   the_master: dffr_a port map( clk, RegWr_not, '0', '0', RegWr, '1', master_RegWr); 
--   the_master2: dffr_a port map (clk, MemWr_not, '0', '0', MemWr, '1', master_MemWr);
   
   mux_rs_rt_rw: mux_5_S port map ( RegDst, Rt, Rd, Rw);
   
   Register_Memory: reg_32 port map ( AND_RegWr, Rw, Rs, Rt, busW_out, busA, busB);
   
   extender_datapath: extender port map ( ExtOp, imm16, imm_extended);
   
   input_B_selector_mux: mux_32 port map ( ALUSrc, busB, imm_extended, busB_In);
   
   alu_map: alu port map ( ALUctr, busA, busB_In, cout, ovf, Equal, ALU_Output);
  
   Data_Memory:  	sram	generic map (mem_file => "unsigned_sum.dat")
 			                 port map (cs=>'1', oe=>'1', we=>AND_MemWr,addr=>ALU_Output, din=>busB, dout=>Data_Out);
 			 
   Mem_to_reg_mux: mux_32 port map ( MemtoReg, ALU_Output, Data_Out, busW);

end structural;


