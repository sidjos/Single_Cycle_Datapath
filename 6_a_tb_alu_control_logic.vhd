library IEEE;
use IEEE.std_logic_1164.all;
--Additional standard or custom libraries go here
entity alu_control_logic_s_tb is
  port(
    nPC_sel_tb  : out std_logic := '0';
    Reg_Dst_tb  : out std_logic := '0';
    RegWr_tb    : out std_logic := '0';
    ExtOp_tb    : out std_logic := '0';
    ALUSrc_tb   : out std_logic := '0';
    ALUctr_tb   : out std_logic_vector(3 downto 0) := "0000";
    MemWr_tb    : out std_logic := '0';
    MemtoReg_tb : out std_logic := '0';
    Branch_tb   : out std_logic := '0';
    Rd_tb, Rs_tb, Rt_tb: out std_logic_vector(4 downto 0):= B"0_0000";
    Imm16_tb    : out std_logic_vector(15 downto 0)    
  );
end entity alu_control_logic_s_tb;

architecture behavioral of alu_control_logic_s_tb is
-- Entity (as component) and input ports (as signals) go here
component alu_control_logic_s is
  port (
    instruction: in std_logic_vector (31 downto 0);
    nPC_sel  : out std_logic;
    Reg_Dst  : out std_logic;
    RegWr    : out std_logic;
    ExtOp    : out std_logic;
    ALUSrc   : out std_logic;
    ALUctr   : out std_logic_vector(3 downto 0);
    MemWr    : out std_logic;
    MemtoReg : out std_logic;
    Branch   : out std_logic;
    Rd, Rs, Rt: out std_logic_vector(4 downto 0);
    Imm16 : out std_logic_vector(15 downto 0)    
  );
  end component alu_control_logic_s;
-- component declaration and stimuli processes go here
  signal opcode_tb, funct_tb : std_logic_vector(5 downto 0) := B"00_0000";
  signal instruction_tb : std_logic_vector (31 downto 0) := X"00_00_00_00";
  -- signal nPC_sel_tb, Reg_Dst_tb, RegWr_tb, ExtOp_tb, ALUSrc_tb, ALUctr_tb, MemWr_tb, MemtoReg_tb : std_logic := '0';

begin
  DUT: alu_control_logic_s
    port map(instruction_tb, nPC_sel_tb, Reg_Dst_tb, RegWr_tb, ExtOp_tb, ALUSrc_tb, 
      ALUctr_tb, MemWr_tb, MemtoReg_tb, Branch_tb, Rd_tb, Rs_tb, Rt_tb, Imm16_tb);
    
    stimulus_test : process is
    begin 
-- start
-- r type instruction
      -- sll  opcode_tb <= B"00_0000"; funct_tb <= B"00_0000";
      instruction_tb <= B"00_0000_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);
      wait for 20 ns;
      -- addu opcode_tb <= B"00_0000"; funct_tb <= B"10_0000"; wait for 20 ns;      
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;
      -- addu opcode_tb <= B"00_0000"; funct_tb <= B"10_0001"; wait for 20 ns;
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0001"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;      
      -- sub opcode_tb <= B"00_0000"; funct_tb <= B"10_0010"; wait for 20 ns;      
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0010"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;
      -- subu opcode_tb <= B"00_0000"; funct_tb <= B"10_0011"; wait for 20 ns;      
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0011"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;      
      -- and opcode_tb <= B"00_0000"; funct_tb <= B"10_0100"; wait for 20 ns;      
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0100"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;      
      -- or opcode_tb <= B"00_0000"; funct_tb <= B"10_0101"; wait for 20 ns;            
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_0101"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;            
      -- sll opcode_tb <= B"00_0000"; funct_tb <= B"00_0000"; wait for 20 ns;  
      instruction_tb <= B"00_0000_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;            
      -- slt opcode_tb <= B"00_0000"; funct_tb <= B"10_1010"; wait for 20 ns; 
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_1010"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;             
      -- slu opcode_tb <= B"00_0000"; funct_tb <= B"10_1011"; wait for 20 ns;   
      instruction_tb <= B"00_0000_10001_10001_10001_00000_10_1011"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;                  
      -- reset the funct to zero opcode_tb <= B"00_0000"; funct_tb <= B"00_0000";
      instruction_tb <= B"00_0000_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;                  
-- r type instruction        
-- i type instruction
      -- addi opcode_tb <= B"00_1000"; wait for 20 ns;  
      instruction_tb <= B"00_1000_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;
      -- lw opcode_tb <= B"10_0011"; wait for 20 ns;   
      instruction_tb <= B"10_0011_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;
      -- sw opcode_tb <= B"10_1011"; wait for 20 ns;
      instruction_tb <= B"10_1011_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;      
      -- beq opcode_tb <= B"00_0100"; wait for 20 ns;     
      instruction_tb <= B"00_0100_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;         
      -- bne opcode_tb <= B"00_0101"; wait for 20 ns;   
      instruction_tb <= B"00_0101_10001_10001_10001_00000_00_0000"; 
      opcode_tb <= instruction_tb(31 downto 26);
      funct_tb <= instruction_tb(5 downto 0);      
      wait for 20 ns;           
-- i type instruction
      wait;
    end process stimulus_test;
end architecture behavioral;


-- output(31 downto 16) <=B"0000000000000000";
-- output(15 downto 0) <= input;