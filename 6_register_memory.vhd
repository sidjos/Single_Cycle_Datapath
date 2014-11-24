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
        RegWr: in std_logic;
        WrEnS      : in std_logic;
        ReadEn  : in std_logic;
        input	 : in std_logic_vector(31 downto 0);
        output   	 : out std_logic_vector(31 downto 0)
      );
end component;

component or32_S is 
   port(
       
ip0 : in std_logic;
ip1 : in std_logic;
ip2 : in std_logic;
ip3 : in std_logic;
ip4 : in std_logic;
ip5 : in std_logic;
ip6 : in std_logic;
ip7 : in std_logic;
ip8 : in std_logic;
ip9 : in std_logic;
ip10 : in std_logic;
ip11 : in std_logic;
ip12 : in std_logic;
ip13 : in std_logic;
ip14 : in std_logic;
ip15 : in std_logic;
ip16 : in std_logic;
ip17 : in std_logic;
ip18 : in std_logic;
ip19 : in std_logic;
ip20 : in std_logic;
ip21 : in std_logic;
ip22 : in std_logic;
ip23 : in std_logic;
ip24 : in std_logic;
ip25 : in std_logic;
ip26 : in std_logic;
ip27 : in std_logic;
ip28 : in std_logic;
ip29 : in std_logic;
ip30 : in std_logic;
ip31 : in std_logic;
       op: out std_logic
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


--Reg_A_0: register_32 port map (clk, rst, reg_wren(0), reg_readEn_A(0), input, A_mem_0);

Reg_A_0: register_32 port map (clk, rst, RegWr, reg_wren(0), reg_readEn_A(0), input, A_mem_0);
Reg_A_1: register_32 port map (clk, rst, RegWr, reg_wren(1), reg_readEn_A(1), input, A_mem_1);
Reg_A_2: register_32 port map (clk, rst, RegWr, reg_wren(2), reg_readEn_A(2), input, A_mem_2);
Reg_A_3: register_32 port map (clk, rst, RegWr, reg_wren(3), reg_readEn_A(3), input, A_mem_3);
Reg_A_4: register_32 port map (clk, rst, RegWr, reg_wren(4), reg_readEn_A(4), input, A_mem_4);
Reg_A_5: register_32 port map (clk, rst, RegWr, reg_wren(5), reg_readEn_A(5), input, A_mem_5);
Reg_A_6: register_32 port map (clk, rst, RegWr, reg_wren(6), reg_readEn_A(6), input, A_mem_6);
Reg_A_7: register_32 port map (clk, rst, RegWr, reg_wren(7), reg_readEn_A(7), input, A_mem_7);
Reg_A_8: register_32 port map (clk, rst, RegWr, reg_wren(8), reg_readEn_A(8), input, A_mem_8);
Reg_A_9: register_32 port map (clk, rst, RegWr, reg_wren(9), reg_readEn_A(9), input, A_mem_9);
Reg_A_10: register_32 port map (clk, rst, RegWr, reg_wren(10), reg_readEn_A(10), input, A_mem_10);
Reg_A_11: register_32 port map (clk, rst, RegWr, reg_wren(11), reg_readEn_A(11), input, A_mem_11);
Reg_A_12: register_32 port map (clk, rst, RegWr, reg_wren(12), reg_readEn_A(12), input, A_mem_12);
Reg_A_13: register_32 port map (clk, rst, RegWr, reg_wren(13), reg_readEn_A(13), input, A_mem_13);
Reg_A_14: register_32 port map (clk, rst, RegWr, reg_wren(14), reg_readEn_A(14), input, A_mem_14);
Reg_A_15: register_32 port map (clk, rst, RegWr, reg_wren(15), reg_readEn_A(15), input, A_mem_15);
Reg_A_16: register_32 port map (clk, rst, RegWr, reg_wren(16), reg_readEn_A(16), input, A_mem_16);
Reg_A_17: register_32 port map (clk, rst, RegWr, reg_wren(17), reg_readEn_A(17), input, A_mem_17);
Reg_A_18: register_32 port map (clk, rst, RegWr, reg_wren(18), reg_readEn_A(18), input, A_mem_18);
Reg_A_19: register_32 port map (clk, rst, RegWr, reg_wren(19), reg_readEn_A(19), input, A_mem_19);
Reg_A_20: register_32 port map (clk, rst, RegWr, reg_wren(20), reg_readEn_A(20), input, A_mem_20);
Reg_A_21: register_32 port map (clk, rst, RegWr, reg_wren(21), reg_readEn_A(21), input, A_mem_21);
Reg_A_22: register_32 port map (clk, rst, RegWr, reg_wren(22), reg_readEn_A(22), input, A_mem_22);
Reg_A_23: register_32 port map (clk, rst, RegWr, reg_wren(23), reg_readEn_A(23), input, A_mem_23);
Reg_A_24: register_32 port map (clk, rst, RegWr, reg_wren(24), reg_readEn_A(24), input, A_mem_24);
Reg_A_25: register_32 port map (clk, rst, RegWr, reg_wren(25), reg_readEn_A(25), input, A_mem_25);
Reg_A_26: register_32 port map (clk, rst, RegWr, reg_wren(26), reg_readEn_A(26), input, A_mem_26);
Reg_A_27: register_32 port map (clk, rst, RegWr, reg_wren(27), reg_readEn_A(27), input, A_mem_27);
Reg_A_28: register_32 port map (clk, rst, RegWr, reg_wren(28), reg_readEn_A(28), input, A_mem_28);
Reg_A_29: register_32 port map (clk, rst, RegWr, reg_wren(29), reg_readEn_A(29), input, A_mem_29);
Reg_A_30: register_32 port map (clk, rst, RegWr, reg_wren(30), reg_readEn_A(30), input, A_mem_30);
Reg_A_31: register_32 port map (clk, rst, RegWr, reg_wren(31), reg_readEn_A(31), input, A_mem_31);

Reg_B_0: register_32 port map (clk, rst, RegWr, reg_wren(0), reg_readEn_B(0), input, B_mem_0);
Reg_B_1: register_32 port map (clk, rst, RegWr, reg_wren(1), reg_readEn_B(1), input, B_mem_1);
Reg_B_2: register_32 port map (clk, rst, RegWr, reg_wren(2), reg_readEn_B(2), input, B_mem_2);
Reg_B_3: register_32 port map (clk, rst, RegWr, reg_wren(3), reg_readEn_B(3), input, B_mem_3);
Reg_B_4: register_32 port map (clk, rst, RegWr, reg_wren(4), reg_readEn_B(4), input, B_mem_4);
Reg_B_5: register_32 port map (clk, rst, RegWr, reg_wren(5), reg_readEn_B(5), input, B_mem_5);
Reg_B_6: register_32 port map (clk, rst, RegWr, reg_wren(6), reg_readEn_B(6), input, B_mem_6);
Reg_B_7: register_32 port map (clk, rst, RegWr, reg_wren(7), reg_readEn_B(7), input, B_mem_7);
Reg_B_8: register_32 port map (clk, rst, RegWr, reg_wren(8), reg_readEn_B(8), input, B_mem_8);
Reg_B_9: register_32 port map (clk, rst, RegWr, reg_wren(9), reg_readEn_B(9), input, B_mem_9);
Reg_B_10: register_32 port map (clk, rst, RegWr, reg_wren(10), reg_readEn_B(10), input, B_mem_10);
Reg_B_11: register_32 port map (clk, rst, RegWr, reg_wren(11), reg_readEn_B(11), input, B_mem_11);
Reg_B_12: register_32 port map (clk, rst, RegWr, reg_wren(12), reg_readEn_B(12), input, B_mem_12);
Reg_B_13: register_32 port map (clk, rst, RegWr, reg_wren(13), reg_readEn_B(13), input, B_mem_13);
Reg_B_14: register_32 port map (clk, rst, RegWr, reg_wren(14), reg_readEn_B(14), input, B_mem_14);
Reg_B_15: register_32 port map (clk, rst, RegWr, reg_wren(15), reg_readEn_B(15), input, B_mem_15);
Reg_B_16: register_32 port map (clk, rst, RegWr, reg_wren(16), reg_readEn_B(16), input, B_mem_16);
Reg_B_17: register_32 port map (clk, rst, RegWr, reg_wren(17), reg_readEn_B(17), input, B_mem_17);
Reg_B_18: register_32 port map (clk, rst, RegWr, reg_wren(18), reg_readEn_B(18), input, B_mem_18);
Reg_B_19: register_32 port map (clk, rst, RegWr, reg_wren(19), reg_readEn_B(19), input, B_mem_19);
Reg_B_20: register_32 port map (clk, rst, RegWr, reg_wren(20), reg_readEn_B(20), input, B_mem_20);
Reg_B_21: register_32 port map (clk, rst, RegWr, reg_wren(21), reg_readEn_B(21), input, B_mem_21);
Reg_B_22: register_32 port map (clk, rst, RegWr, reg_wren(22), reg_readEn_B(22), input, B_mem_22);
Reg_B_23: register_32 port map (clk, rst, RegWr, reg_wren(23), reg_readEn_B(23), input, B_mem_23);
Reg_B_24: register_32 port map (clk, rst, RegWr, reg_wren(24), reg_readEn_B(24), input, B_mem_24);
Reg_B_25: register_32 port map (clk, rst, RegWr, reg_wren(25), reg_readEn_B(25), input, B_mem_25);
Reg_B_26: register_32 port map (clk, rst, RegWr, reg_wren(26), reg_readEn_B(26), input, B_mem_26);
Reg_B_27: register_32 port map (clk, rst, RegWr, reg_wren(27), reg_readEn_B(27), input, B_mem_27);
Reg_B_28: register_32 port map (clk, rst, RegWr, reg_wren(28), reg_readEn_B(28), input, B_mem_28);
Reg_B_29: register_32 port map (clk, rst, RegWr, reg_wren(29), reg_readEn_B(29), input, B_mem_29);
Reg_B_30: register_32 port map (clk, rst, RegWr, reg_wren(30), reg_readEn_B(30), input, B_mem_30);
Reg_B_31: register_32 port map (clk, rst, RegWr, reg_wren(31), reg_readEn_B(31), input, B_mem_31);


generate_memory_or_output:
    for i in 0 to 31 generate
        or_A: or32_S port map (A_mem_0(i),A_mem_1(i),A_mem_2(i),A_mem_3(i),A_mem_4(i),A_mem_5(i),A_mem_6(i),A_mem_7(i),A_mem_8(i),A_mem_9(i),A_mem_10(i),A_mem_11(i),A_mem_12(i),A_mem_13(i),A_mem_14(i),A_mem_15(i),A_mem_16(i),A_mem_17(i),A_mem_18(i),A_mem_19(i),A_mem_20(i),A_mem_21(i),A_mem_22(i),A_mem_23(i),A_mem_24(i),A_mem_25(i),A_mem_26(i),A_mem_27(i),A_mem_28(i),A_mem_29(i),A_mem_30(i),A_mem_31(i), 
                                A(i));
        or_B: or32_S port map (B_mem_0(i),B_mem_1(i),B_mem_2(i),B_mem_3(i),B_mem_4(i),B_mem_5(i),B_mem_6(i),B_mem_7(i),B_mem_8(i),B_mem_9(i),B_mem_10(i),B_mem_11(i),B_mem_12(i),B_mem_13(i),B_mem_14(i),B_mem_15(i),B_mem_16(i),B_mem_17(i),B_mem_18(i),B_mem_19(i),B_mem_20(i),B_mem_21(i),B_mem_22(i),B_mem_23(i),B_mem_24(i),B_mem_25(i),B_mem_26(i),B_mem_27(i),B_mem_28(i),B_mem_29(i),B_mem_30(i),B_mem_31(i), 
                                B(i)); 
    end generate generate_memory_or_output;

end structural;



    
    