library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity top_level is
    port(
        clk : in std_logic;
        ovf, cout: out std_logic
        );
end top_level;

architecture structural of top_level is

component datapath_6 is
    port(
        RegWr, RegDst, Clk, MemWr, MemtoReg, ALUSrc, ExtOp : in std_logic;
        ALUCtr: in std_logic_vector (3 downto 0);
        Rd, Rt, Rs: in std_logic_vector (4 downto 0);
        imm16: in std_logic_vector (15 downto 0);
        Equal, ovf, cout: out std_logic
        );
end component;
        
component alu_control_logic_s is
  port (
    instruction: in std_logic_vector (31 downto 0);
    Reg_Dst  : out std_logic;
    RegWr    : out std_logic;
    ExtOp    : out std_logic;
    ALUSrc   : out std_logic;
    ALUctr   : out std_logic_vector(3 downto 0);
    MemWr    : out std_logic;
    MemtoReg : out std_logic;
    Branch   : out std_logic;
    Rd, Rs, Rt: out std_logic_vector(4 downto 0)
  );
end component;

component ins is
	port (
		imm16: 	in std_logic_vector(15 downto 0);
		clk: 	in std_logic; --Negative Edge Trigger
		branch: in std_logic;
		zero:	in std_logic;
		instruction: out std_logic_vector ( 31 downto 0)
	     );
	
end component;
        
signal imm160: std_logic_vector(15 downto 0);
signal Rd0, Rt0, Rs0: std_logic_vector ( 4 downto 0);
signal ALUCtr0: std_logic_vector( 3 downto 0);
signal clk0, branch0, zero0, Reg_Dst0, RegWr0, ExtOp0, ALUSrc0, ALUctr0, MemWr0, MemtoReg0, Branch0, ovf0, cout0: std_logic ;
signal instruction0: Std_logic_vector ( 31 downto 0);

begin
    
    datapath: datapath_6 port map ( RegWr=>RegWr0, Reg_Dst=>Reg_Dst0, Clk=>Clk0, MemWr=>MemWr0, MemtoReg=>MemtoReg0, ALUSrc=>ALUSrc0, Ext0p=>ExtOp0, ALUCtr=>ALUCtr0, Rd=>Rd0, Rt=>Rt0, Rs=>Rs0, 
                                     imm16=>imm160, Equal=>Equal0, ovf=>ovf, cout=>cout);
    instruction_fetch: ins port map ( imm16=>imm160,clk=>clk0, branch=>branch0, zero=>zero0, instruction=>instruction0);
    
    control : alu_control_logic_s port map (instruction=>instruction0, Reg_Dst=>Reg_Dst0, RegWr=>RegWr0, Ext0p=>ExtOp0, ALUSrc=>ALUSrc0, ALUctr=>ALUctr0, MemWr=>MemWr0, MemtoReg=>MemtoReg0,
                                           Branch=>Branch0, Rd=>Rd0, Rs=>Rs0, Rt=>Rt0);
end
    
    
    