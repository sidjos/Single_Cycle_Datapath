library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;


entity reg_32 is
    
      port (
        clk   : in std_logic;
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


component register_32 is
    
      port (
        clk   : in std_logic;
        rst: in std_logic;
        WrEn      : in std_logic;
        ReadEn  : in std_logic;
        input	 : in std_logic_vector(31 downto 0);
        A   	 : out std_logic_vector(31 downto 0)
      );
end register_32;

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


architecture structural of reg_32 is

mux_rs_rt_rw: mux_5_S port map ( RegDst, Rt, Rd, Rw);
    
decoder_A: dec_n generic map (n=>5)
                    port map ( src=>rs, z=>reg_readEn_A);

decoder_B: dec_n generic map (n=>5)
                    port map ( src=>rt, z=>reg_readEn_B);

decoder_Wr: dec_n generic map (n=>5)
                    port map ( src=>rw, z=>reg_wren);

generate_register_memory:
    for i in 0 to 31 generate
        Reg_A: register_32 port map (clk, rst, reg_wren(i), reg_readEn_A(i), input(i), A_mem(i));
        Reg_B: register_32 port map (clk, rst, reg_wren(i), reg_readEn_B(i), input(i), B_mem(i));
    end generate generate_register_memory;





    
    