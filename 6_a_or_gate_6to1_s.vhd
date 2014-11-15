library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity or_gate_6to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5 : in std_logic;
    z : out std_logic
  );
end or_gate_6to1_s;

architecture or_gate_6to1_str of or_gate_6to1_s is
  signal or_so0, or_so1, or_so2, or_so3 : std_logic;
begin 
  or_g0 : entity work.or_gate
    port map(x_0, x_1, or_so0);

  or_g1 : entity work.or_gate
    port map(x_2, x_3, or_so1);

  or_g2 : entity work.or_gate
    port map(x_4, x_5, or_so2);

  or_g3 : entity work.or_gate
    port map(or_so0, or_so1, or_so3);

  or_g4 : entity work.or_gate
    port map(or_so3, or_so2, z);
end architecture or_gate_6to1_str;