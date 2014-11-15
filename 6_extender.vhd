library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity extender is
        port(
            ExtOp: in std_logic;
            imm16: in std_logic_vector ( 15 downto 0);
            extended_output: out std_logic_vector ( 31 downto 0)
            );
    end extender;
    
architecture structural of extender is

    component mux_32 is
      port (
	    sel   : in  std_logic;
	    src0  : in  std_logic_vector(31 downto 0);
	    src1  : in  std_logic_vector(31 downto 0);
	    z	    : out std_logic_vector(31 downto 0)
      );
    end component;
    
    signal signExtended, zeroExtended, oneExtended : std_logic_vector( 31 downto 0);
    signal signBit: std_logic;
    
    begin 
    
    zeroExtended <= "0000000000000000" & imm16;
    oneExtended <= "1111111111111111" & imm16;
    signBit <= imm16(15);
    
    extender_mux_1: mux_32 port map ( signBit, zeroExtended, oneExtended, signExtended);
    
    extender_mux_2: mux_32 port map ( ExtOp, zeroExtended, signExtended, extended_output);
    
    end structural;