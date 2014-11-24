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

signal clock : std_logic:='0';
signal reset_sig : std_logic;
begin
test: top_level port map (clk=>clock, reset=>reset_sig, ovf=>ovf,cout=>cout);
clock <= not clock after 5 ns;

testprocess: process begin
reset_sig <= '1';
wait for 11 ns;
reset_sig <='0';
wait for 1 ns;
reset_sig<='0';
wait;

end process;

end structural;
