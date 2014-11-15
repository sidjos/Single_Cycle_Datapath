library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

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
    
    component Register_Memory is 
        port(
            Rw, Ra, Rb : in std_logic_vector (4 downto 0);
            Clk, RegWr: in std_logic;
            busW: in std_logic_vector ( 31 downto 0);
            busA, busB: out std_logic_vector (31 downto 0)
            );
    end component;

    component Data_Memory is 
        port(
            Clk, WrEn: in std_logic;
            Data_In, Adr: in std_logic_vector(31 downto 0);
            Data_Out: out std_logic_vector (31 downto 0)
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
   
   signal Rw: std_logic_vector ( 4 downto 0);
   signal busA, busB, busW, busB_In, imm_extended, Data_Out, ALU_Output : std_logic_vector (31 downto 0);
   
   begin 
   
   mux_rs_rt_rw: mux_5_S port map ( RegDst, Rt, Rd, Rw);
   
   Register_Memory_0: Register_Memory port map ( Rw, Rs, Rt, Clk, RegWr, busW, busA, busB);
   
   extender_datapath: extender port map ( ExtOp, imm16, imm_extended);
   
   input_B_selector_mux: mux_32 port map ( ALUSrc, busB, imm_extended, busB_In);
   
   alu_map: alu port map ( ALUctr, busA, busB_In, cout, ovf, Equal, ALU_Output);
   
   Data_Memory_0: Data_Memory port map ( Clk, MemWr, busB, ALU_Output, Data_Out );
   
   Mem_to_reg_mux: mux_32 port map ( MemtoReg, ALU_Output, Data_Out, busW);

end structural; 
   
   