library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity and_gate_6to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5  : in std_logic;
    z    : out std_logic
  );
end and_gate_6to1_s;
  
architecture and_gate_6to1_str of and_gate_6to1_s is
  signal and_sol0, and_sol1, and_sol2, and_sol3 : std_logic;
begin 

-- first level
  and_gl11 : entity work.and_gate
    port map(x_0, x_1, and_sol0);                  

  and_gl12 : entity work.and_gate
    port map(x_2, x_3, and_sol1); 

  and_gl13 : entity work.and_gate
    port map(x_4, x_5, and_sol2);

-- second level
  and_gl20 : entity work.and_gate
    port map(and_sol0, and_sol1, and_sol3);

  and_gl21 : entity work.and_gate
    port map(and_sol2, and_sol3, z);      
end architecture and_gate_6to1_str;

