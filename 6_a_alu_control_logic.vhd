library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity alu_control_logic_s is
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
end alu_control_logic_s;
  
-- _g_o the output from the and gate 
-- _n = the output from the not gate. It means that the signal is inverted
-- _g_on = the output from the and gate and it is inverted
architecture alu_control_logic_str of alu_control_logic_s is
  signal opcode_n, funct_n: std_logic_vector(5 downto 0);
  signal add_g_o, addu_g_o, sub_g_o, subu_g_o, and_g_o, or_g_o, sll_g_o, slt_g_o, sltu_g_o : std_logic; -- r type
  signal addi_g_o, lw_g_o, sw_g_o, beq_g_o, bne_g_o : std_logic; -- i type
  signal beq_g_on, bne_g_on, lw_g_on, sw_g_on, sll_g_on, slt_g_on, sltu_g_on : std_logic; -- invert instruction add gate
  signal zero_s : std_logic := '0';
  signal opcode, funct: std_logic_vector (5 downto 0);
  signal shamt_s : std_logic_vector(4 downto 0);
  signal Imm16_s, Imm16_shamt_s : std_logic_vector(15 downto 0);
begin 
-- categorized the instruction
  opcode <= instruction(31 downto 26);
  Rs <= instruction(25 downto 21);
  Rt <= instruction(20 downto 16);
  Rd <= instruction(15 downto 11);
  shamt_s <= instruction(10 downto 6);
  funct <= instruction(5 downto 0);
  Imm16_s <= instruction(15 downto 0);

-- invert the code
  not_g_op0 : entity work.not_gate
    port map(opcode(0), opcode_n(0));
  
  not_g_op1 : entity work.not_gate
    port map(opcode(1), opcode_n(1));

  not_g_op2 : entity work.not_gate
    port map(opcode(2), opcode_n(2));

  not_g_op3 : entity work.not_gate
    port map(opcode(3), opcode_n(3));

  not_g_op4 : entity work.not_gate
    port map(opcode(4), opcode_n(4));

  not_g_op5 : entity work.not_gate
    port map(opcode(5), opcode_n(5));            
-- end invert opcode

-- begin invert funct
  not_g_fct0 : entity work.not_gate
    port map(funct(0), funct_n(0));
  
  not_g_fct1 : entity work.not_gate
    port map(funct(1), funct_n(1));

  not_g_fct2 : entity work.not_gate
    port map(funct(2), funct_n(2));

  not_g_fct3 : entity work.not_gate
    port map(funct(3), funct_n(3));

  not_g_fct4 : entity work.not_gate
    port map(funct(4), funct_n(4));

  not_g_fct5 : entity work.not_gate
    port map(funct(5), funct_n(5));
-- end invert funct       

-- and instruction r type
  -- add instrution opcode 00 funct 20 || 5 = MSB
  and_g_add : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct_n(0), funct_n(1), funct_n(2), funct_n(3), funct_n(4), funct(5), add_g_o);  
  -- addu instruction 00 21
  and_g_addu : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct(0), funct_n(1), funct_n(2), funct_n(3), funct_n(4), funct(5), addu_g_o);  
  -- sub00 22
  and_g_sub : entity work.and_gate_12to1_s 
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct_n(0), funct(1), funct_n(2), funct_n(3), funct_n(4), funct(5), sub_g_o);  
  -- 00 23
  and_g_subu : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct(0), funct(1), funct_n(2), funct_n(3), funct_n(4), funct(5), subu_g_o);  
  -- 00 24
  and_g_and : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct_n(0), funct_n(1), funct(2), funct_n(3), funct_n(4), funct(5), and_g_o);                        
  -- 00 25
  and_g_or : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct(0), funct_n(1), funct(2), funct_n(3), funct_n(4), funct(5), or_g_o);                        
  -- 00 00
  and_g_sll : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct_n(0), funct_n(1), funct_n(2), funct_n(3), funct_n(4), funct_n(5), sll_g_o);                     
  -- 00 2a
  and_g_slt : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct_n(0), funct(1), funct_n(2), funct(3), funct_n(4), funct(5), slt_g_o);                                           
  -- 00 2b
  and_g_sltu : entity work.and_gate_12to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode_n(5), 
      funct(0), funct(1), funct_n(2), funct(3), funct_n(4), funct(5), sltu_g_o);     
-- end instruction r type    

-- and instruction i type
  -- 08
  and_g_addi : entity work.and_gate_6to1_s
    port map(opcode_n(0), opcode_n(1), opcode_n(2), opcode(3), opcode_n(4), opcode_n(5), addi_g_o);  
  -- 23
  and_g_lw : entity work.and_gate_6to1_s
    port map(opcode(0), opcode(1), opcode_n(2), opcode_n(3), opcode_n(4), opcode(5), lw_g_o);    
  -- 2b
  and_g_sw : entity work.and_gate_6to1_s
    port map(opcode(0), opcode(1), opcode_n(2), opcode(3), opcode_n(4), opcode(5), sw_g_o); 
  -- 4
  and_g_beq : entity work.and_gate_6to1_s
    port map(opcode_n(0), opcode_n(1), opcode(2), opcode_n(3), opcode_n(4), opcode_n(5), beq_g_o);    
  -- 5
  and_g_bne : entity work.and_gate_6to1_s
    port map(opcode(0), opcode_n(1), opcode(2), opcode_n(3), opcode_n(4), opcode_n(5), bne_g_o);        
-- end instruction i type

-- begin invert instruction add gate
  not_g_beg_g_on : entity work.not_gate
    port map(beq_g_o, beq_g_on);

  not_g_bne_g_on : entity work.not_gate
    port map(bne_g_o, bne_g_on);    

  not_g_lw_g_on : entity work.not_gate
    port map(lw_g_o, lw_g_on);    

  not_g_sw_g_on : entity work.not_gate
    port map(sw_g_o, sw_g_on);    

  not_g_sll_g_on : entity work.not_gate
    port map(sll_g_o, sll_g_on);    

  not_g_slt_g_on : entity work.not_gate
    port map(slt_g_o, slt_g_on);    

  not_g_sltu_g_on : entity work.not_gate
    port map(sltu_g_o, sltu_g_on);    
-- end invert instruction add gate

-- begin control signal except ALUctr
  or_g_npc_sel : entity work.or_gate_14to1_s
    port map(add_g_o, addu_g_o, sub_g_o, subu_g_o, and_g_o, or_g_o, 
             sll_g_o, slt_g_o, sltu_g_o, addi_g_o, lw_g_o, sw_g_o, zero_s, zero_s, nPC_sel);    

  or_g_reg_dst : entity work.or_gate_14to1_s
    port map(add_g_o, addu_g_o, sub_g_o, subu_g_o, and_g_o, or_g_o, 
             sll_g_o, slt_g_o, sltu_g_o, addi_g_o, zero_s, zero_s, zero_s, zero_s, Reg_Dst);     

  or_g_regwr : entity work.or_gate_14to1_s
    port map(add_g_o, addu_g_o, sub_g_o, subu_g_o, and_g_o, or_g_o, 
             sll_g_o, slt_g_o, sltu_g_o, addi_g_o, lw_g_o, zero_s, zero_s, zero_s, RegWr);       

  or_g_extop : entity work.or_gate_3to1_s
    port map(addi_g_o, lw_g_o, sw_g_o, ExtOp);        

  or_g_alusrc : entity work.or_gate_4to1_s
    port map(addi_g_o, sll_g_o, lw_g_o, sw_g_o, ALUSrc);  

  and_g_memwr : entity work.and_gate
    port map(sw_g_o, sw_g_o, MemWr);

  and_g_memtoreg : entity work.and_gate 
    port map(lw_g_o, lw_g_o, MemtoReg);

  or_g_branch : entity work.or_gate
    port map(beq_g_o, bne_g_o, Branch);
-- end control signal except ALUctr

-- mux between the Imm16 and the Imm16 from 5-bit shamt 
-- output(31 downto 16) <= B"0000000000000000";
-- output(15 downto 0) <= input;  
  Imm16_shamt_s(15 downto 5) <= B"0_00000_00000";
  Imm16_shamt_s(4 downto 0) <= shamt_s;
  mux_Imm16_vs_Imm16_shamt_s : entity work.mux_n
    generic map (n => 16)
    -- port map (sll_g_o => sel, Imm16_s => src0, Imm16_shamt_s => src1, Imm16 => z);
    port map (
      sel => sll_g_o, 
      src0(15 downto 0) => Imm16_s, 
      src1(15 downto 0) => Imm16_shamt_s,
      z(15 downto 0) => Imm16
      );
-- alu signal
-- add  0000
-- sub  0001
-- and  0010
-- or   0011
-- sll  0100
-- slt  1001
-- sltu 1101
-- begin alucrt
  -- two signals of subu_g_o for the input of the or gate because I am too lazy to write or_gate_5to1_s
  or_g_alucrt0: entity work.or_gate_7to1_s
    port map(sub_g_o, or_g_o, slt_g_o, sltu_g_o, subu_g_o, bne_g_o, beq_g_o, ALUctr(0));

  or_g_alucrt1 : entity work.or_gate
    port map(and_g_o, or_g_o, ALUctr(1));    

  or_g_alucrt2 : entity work.or_gate
    port map(sll_g_o, sltu_g_o, ALUctr(2));        

  or_g_alucrt3 : entity work.or_gate
    port map(slt_g_o, sltu_g_o, ALUctr(3));        
-- end alucrt
end architecture alu_control_logic_str;