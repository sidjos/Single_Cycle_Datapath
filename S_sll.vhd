library ieee;
use ieee.std_logic_1164.all; 
use work.eecs361_gates.all;
use work.eecs361.all;

entity sll_32 is 
   port(
        a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(4 downto 0);
        z : out std_logic_vector(31 downto 0)
        );
end sll_32;

architecture structural of sll_32 is
        
    component mux_32 is
      port (
	    sel   : in  std_logic;
	    src0  : in  std_logic_vector(31 downto 0);
	    src1  : in  std_logic_vector(31 downto 0);
	    z	    : out std_logic_vector(31 downto 0)
      );
    end component;
      
    signal s0_sll, s1_sll, s2_sll, s3_sll, i_sll0, i_sll1, i_sll2, i_sll3, i_sll4 : std_logic_vector( 31 downto 0);
    
    begin
        i_sll0 <= a(30 downto 0) & '0';
        sll_mux0: mux_32 port map ( b(0), a, i_sll0, s0_sll);
        
        i_sll1 <= s0_sll(29 downto 0) & "00";
        sll_mux1: mux_32 port map (b(1), s0_sll, i_sll1, s1_sll);
        
        i_sll2 <= s1_sll(27 downto 0) & "0000";
        sll_mux2: mux_32 port map (b(2), s1_sll, i_sll2, s2_sll);
        
        i_sll3 <= s2_sll( 23 downto 0) & "00000000";
        sll_mux3: mux_32 port map (b(3), s2_sll, i_sll3, s3_sll);
        
        i_sll4 <= s3_sll( 15 downto 0) & "0000000000000000";
        sll_mux4: mux_32 port map (b(4), s3_sll, i_sll4, z);
        
   end structural; 