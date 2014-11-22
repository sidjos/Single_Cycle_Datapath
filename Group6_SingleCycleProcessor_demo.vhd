library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity Group6_SingleCycleProcessor_demo is
port (
	ovf : out std_logic;
	cout : out std_logic
);
end Group6_SingleCycleProcessor_demo;

architecture structural of Group6_SingleCycleProcessor_demo is


component top_level is
  port (
        clk : in std_logic;
        reset: in std_logic;
        ovf, cout: out std_logic    
  );
end component;

signal clock, reset : std_logic;

begin

test: top_level port map (clock, reset, ovf,cout);

testprocess: process begin
clock<='0';
reset <= '1';
wait for 5 ns;
reset <='0';
wait for 5 ns;

clock <= not clock after 10 ns;

wait;
end process;

end structural;
