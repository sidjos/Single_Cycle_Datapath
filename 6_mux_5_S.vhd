library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity mux_5_S is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector (4 downto 0);
	src1  :	in	std_logic_vector (4 downto 0);
	z	  : out std_logic_vector ( 4 downto 0)
  );
end mux_5_S;

architecture structural of mux_5_S is    
   component mux is
     port (
	   sel	  : in	std_logic;
	   src0  :	in	std_logic;
	   src1  :	in	std_logic;
	   z	  : out std_logic
     );
   end component;
   
   begin
       
       mux0: mux port map ( sel, src0(0), src1(0), z(0));
       mux1: mux port map ( sel, src0(1), src1(1), z(1));
       mux2: mux port map ( sel, src0(2), src1(2), z(2));
       mux3: mux port map ( sel, src0(3), src1(3), z(3));
       mux4: mux port map ( sel, src0(4), src1(4), z(4));

end structural;
