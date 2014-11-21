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
        ovf, cout: out std_logic    
  );
end component;

signal clk : std_logic;

begin

clk <= not clk after 5 ns;

test: top_level port map (clk,ovf,cout);

end structural;

