library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;


entity reg_32 is
    
      port (
        clk   : in std_logic;
        rst   : in std_logic; 
        regwr        : in  std_logic;
        RegDst      : in std_logic;
        rs 		 : in std_logic_vector(4 downto 0);
        rt 		 : in std_logic_vector(4 downto 0);
        rd 		 : in std_logic_vector(4 downto 0);
        input	 : in std_logic_vector(31 downto 0);
        A   	 : out std_logic_vector(31 downto 0);
        B  		 : out std_logic_vector(31 downto 0)
      );
end reg_32;

architecture structural of reg_32 is

component register_32 is
    
      port (
        clk   : in std_logic;
        rst: in std_logic;
        WrEn      : in std_logic;
        ReadEn  : in std_logic;
        input	 : in std_logic_vector(31 downto 0);
        A   	 : out std_logic_vector(31 downto 0)
      );
end component;


component dec_n is
  generic (
    n	: integer
  );
  port (
    src	: in std_logic_vector(n-1 downto 0);
    z	: out std_logic_vector((2**n)-1 downto 0)
  );
end  component;

component mux_5_S is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector (4 downto 0);
	src1  :	in	std_logic_vector (4 downto 0);
	z	  : out std_logic_vector ( 4 downto 0)
  );
end component;

component or32_S is 
   port(
       ip: in std_logic_vector ( 31 downto 0);
       op: out std_logic
       );
end component;

signal reg_readEn_A, reg_readEn_B, reg_wren: std_logic_vector( 31 downto 0);
signal rw: std_logic_vector ( 4 downto 0);

signal A_mem_0,A_mem_1,A_mem_2,A_mem_3,A_mem_4,A_mem_5,A_mem_6,A_mem_7,A_mem_8,A_mem_9,A_mem_10,A_mem_11,A_mem_12,A_mem_13,A_mem_14,A_mem_15,A_mem_16,A_mem_17,A_mem_18,A_mem_19,A_mem_20,A_mem_21,A_mem_22,A_mem_23,A_mem_24,A_mem_25,A_mem_26,A_mem_27,A_mem_28,A_mem_29,A_mem_30,A_mem_31: std_logic_vector( 31 downto 0);
signal B_mem_0,B_mem_1,B_mem_2,B_mem_3,B_mem_4,B_mem_5,B_mem_6,B_mem_7,B_mem_8,B_mem_9,B_mem_10,B_mem_11,B_mem_12,B_mem_13,B_mem_14,B_mem_15,B_mem_16,B_mem_17,B_mem_18,B_mem_19,B_mem_20,B_mem_21,B_mem_22,B_mem_23,B_mem_24,B_mem_25,B_mem_26,B_mem_27,B_mem_28,B_mem_29,B_mem_30,B_mem_31: std_logic_vector( 31 downto 0);


begin

mux_rs_rt_rw: mux_5_S port map ( RegDst, rt, rd, rw);
    
decoder_A: dec_n generic map (n=>5)
                    port map ( src=>rs, z=>reg_readEn_A);

decoder_B: dec_n generic map (n=>5)
                    port map ( src=>rt, z=>reg_readEn_B);

decoder_Wr: dec_n generic map (n=>5)
                    port map ( src=>rw, z=>reg_wren);

--generate_register_memory:
--    for i in 0 to 31 generate
--        Reg_A: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem(i));
--        Reg_B: register_32 port map (clk, rst, reg_wren(i), reg_readEn_B(i), input(i), B_mem(i));
--    end generate generate_register_memory;


Reg_A_0: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_0(i));
Reg_A_1: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_1(i));
Reg_A_2: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_2(i));
Reg_A_3: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_3(i));
Reg_A_4: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_4(i));
Reg_A_5: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_5(i));
Reg_A_6: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_6(i));
Reg_A_7: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_7(i));
Reg_A_8: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_8(i));
Reg_A_9: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_9(i));
Reg_A_10: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_10(i));
Reg_A_11: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_11(i));
Reg_A_12: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_12(i));
Reg_A_13: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_13(i));
Reg_A_14: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_14(i));
Reg_A_15: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_15(i));
Reg_A_16: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_16(i));
Reg_A_17: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_17(i));
Reg_A_18: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_18(i));
Reg_A_19: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_19(i));
Reg_A_20: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_20(i));
Reg_A_21: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_21(i));
Reg_A_22: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_22(i));
Reg_A_23: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_23(i));
Reg_A_24: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_24(i));
Reg_A_25: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_25(i));
Reg_A_26: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_26(i));
Reg_A_27: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_27(i));
Reg_A_28: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_28(i));
Reg_A_29: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_29(i));
Reg_A_30: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_30(i));
Reg_A_31: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem_31(i));

Reg_B_0: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_0(i));
Reg_B_1: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_1(i));
Reg_B_2: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_2(i));
Reg_B_3: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_3(i));
Reg_B_4: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_4(i));
Reg_B_5: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_5(i));
Reg_B_6: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_6(i));
Reg_B_7: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_7(i));
Reg_B_8: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_8(i));
Reg_B_9: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_9(i));
Reg_B_10: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_10(i));
Reg_B_11: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_11(i));
Reg_B_12: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_12(i));
Reg_B_13: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_13(i));
Reg_B_14: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_14(i));
Reg_B_15: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_15(i));
Reg_B_16: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_16(i));
Reg_B_17: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_17(i));
Reg_B_18: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_18(i));
Reg_B_19: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_19(i));
Reg_B_20: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_20(i));
Reg_B_21: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_21(i));
Reg_B_22: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_22(i));
Reg_B_23: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_23(i));
Reg_B_24: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_24(i));
Reg_B_25: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_25(i));
Reg_B_26: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_26(i));
Reg_B_27: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_27(i));
Reg_B_28: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_28(i));
Reg_B_29: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_29(i));
Reg_B_30: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_30(i));
Reg_B_31: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), B_mem_31(i));

generate_memory_or_output:
    for i in 0 to 31 generate
        or_A: or_32_S port map (A_mem_0(i),A_mem_1(i),A_mem_2(i),A_mem_3(i),A_mem_4(i),A_mem_5(i),A_mem_6(i),A_mem_7(i),A_mem_8(i),A_mem_9(i),A_mem_10(i),A_mem_11(i),A_mem_12(i),A_mem_13(i),A_mem_14(i),A_mem_15(i),A_mem_16(i),A_mem_17(i),A_mem_18(i),A_mem_19(i),A_mem_20(i),A_mem_21(i),A_mem_22(i),A_mem_23(i),A_mem_24(i),A_mem_25(i),A_mem_26(i),A_mem_27(i),A_mem_28(i),A_mem_29(i),A_mem_30(i),A_mem_31(i), 
                                A(i));
        or_B: or_32_S port map (B_mem_0(i),B_mem_1(i),B_mem_2(i),B_mem_3(i),B_mem_4(i),B_mem_5(i),B_mem_6(i),B_mem_7(i),B_mem_8(i),B_mem_9(i),B_mem_10(i),B_mem_11(i),B_mem_12(i),B_mem_13(i),B_mem_14(i),B_mem_15(i),B_mem_16(i),B_mem_17(i),B_mem_18(i),B_mem_19(i),B_mem_20(i),B_mem_21(i),B_mem_22(i),B_mem_23(i),B_mem_24(i),B_mem_25(i),B_mem_26(i),B_mem_27(i),B_mem_28(i),B_mem_29(i),B_mem_30(i),B_mem_31(i), 
                                B(i));
                                 
 
 
    end generate generate_register_memory;

end structural;



    
    