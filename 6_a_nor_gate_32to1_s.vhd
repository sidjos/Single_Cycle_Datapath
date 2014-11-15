library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity nor_gate_32to1_s is
  port (
    x   : in std_logic_vector(31 downto 0);
    z   : out std_logic
  );
end nor_gate_32to1_s;

architecture nor_gate_4to1_str of nor_gate_32to1_s is
  signal or_1_4to1 : std_logic_vector(7 downto 0);
  signal or_2_4to1 : std_logic_vector(1 downto 0);
  signal or_1_2to1 : std_logic;
begin 
  -- 8 or_4to1_s
  gen_or_1_4to1_loop : for i in 0 to 7 generate
    or_1_4to1_g: entity work.or_gate_4to1_s
      port map (x(i * 4), x(i * 4 + 1), x(i * 4 + 2), x(i * 4 + 3), or_1_4to1(i));
  end generate;
  -- 2 or_4to1_s
  gen_or_2_4to1_loop : for i in 0 to 1 generate
    or_2_4to1_g: entity work.or_gate_4to1_s
      port map (or_1_4to1(i * 4), or_1_4to1(i * 4 + 1), 
        or_1_4to1(i * 4 + 2), or_1_4to1(i * 4 + 3), or_2_4to1(i));
  end generate;
  -- 1 or_2to1_2
  or_g: entity work.or_gate
    port map (or_2_4to1(0), or_2_4to1(1), or_1_2to1);

  -- 1 not_gate
  not_g : entity work.not_gate
    port map (or_1_2to1, z);
end architecture nor_gate_4to1_str;