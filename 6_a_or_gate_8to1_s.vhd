library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity or_gate_8to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7  : in std_logic;
    z    : out std_logic
  );
end or_gate_8to1_s;
  
architecture or_gate_8to1_str of or_gate_8to1_s is
  signal or_sol0, or_sol1, or_sol2, or_sol3, or_sol4, or_sol5 : std_logic;
begin 

-- first level
  or_gl10 : entity work.or_gate
    port map(x_0, x_1, or_sol0);                  

  or_gl11 : entity work.or_gate
    port map(x_2, x_3, or_sol1); 

  or_gl12 : entity work.or_gate
    port map(x_4, x_5, or_sol2);

  or_gl13 : entity work.or_gate
    port map(x_6, x_7, or_sol3);    

-- second level
  or_gl20 : entity work.or_gate
    port map(or_sol0, or_sol1, or_sol4);

  or_gl21 : entity work.or_gate
    port map(or_sol2, or_sol3, or_sol5);      

-- third level
  or_gl31 : entity work.or_gate
    port map(or_sol4, or_sol5, z);      
end architecture or_gate_8to1_str;

