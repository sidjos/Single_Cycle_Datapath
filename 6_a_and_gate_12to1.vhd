library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity and_gate_12to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11 : in std_logic;
    z    : out std_logic
  );
end and_gate_12to1_s;
  
architecture and_gate_12to1_str of and_gate_12to1_s is
  signal and_so0, and_so1, and_so2, and_so3, and_so4, and_so5 : std_logic;
  signal and_sol0, and_sol1, and_sol2, and_sol3, and_sol4 : std_logic;
begin 
-- first level
  and_g0 : entity work.and_gate
    port map(x_0, x_1, and_so0);

  and_g1 : entity work.and_gate
    port map(x_2, x_3, and_so1);

  and_g2 : entity work.and_gate
    port map(x_4, x_5, and_so2);

  and_g3 : entity work.and_gate
    port map(x_6, x_7, and_so3);

  and_g4 : entity work.and_gate
    port map(x_8, x_9, and_so4);

  and_g5 : entity work.and_gate
    port map(x_10, x_11, and_so5);    

-- second level
  and_gl21 : entity work.and_gate
    port map(and_so0, and_so1, and_sol0);                  

  and_gl22 : entity work.and_gate
    port map(and_so2, and_so3, and_sol1); 

  and_gl23 : entity work.and_gate
    port map(and_so4, and_so5, and_sol2);

-- third level
  and_gl30 : entity work.and_gate
    port map(and_sol0, and_sol1, and_sol3);
    
-- fourth level
  and_gl31 : entity work.and_gate
    port map(and_sol2, and_sol3, z);      
end architecture and_gate_12to1_str;

