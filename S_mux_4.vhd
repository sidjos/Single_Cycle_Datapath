library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity mux_4 is
  port (
	sel0	  : in	std_logic;
	sel1   : in std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	src2  : in std_logic;
	src3  : in std_logic;
	z	  : out std_logic
  );
end mux_4;

architecture structural of mux_4 is    
   component mux is
     port (
	   sel	  : in	std_logic;
	   src0  :	in	std_logic;
	   src1  :	in	std_logic;
	   z	  : out std_logic
     );
   end component;
   
   signal mux0_sig, mux1_sig : std_logic; 
   
   begin
       
       mux0: mux port map ( sel0, src0, src1, mux0_sig);
       mux1: mux port map ( sel0, src2, src3, mux1_sig);
       mux3: mux port map ( sel1, mux0_sig, mux1_sig, z);
    
end structural;
