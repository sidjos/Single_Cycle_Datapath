library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity dffr_a_demo is
	port (
		q   	     : out std_logic
	);
end dffr_a_demo;

architecture structural of dffr_a_demo is

component dffr_a is
  port (
    clk	   : in  std_logic;
    arst   : in  std_logic;
    aload  : in  std_logic;
    adata  : in  std_logic;
	d	   : in  std_logic;
    enable : in  std_logic;
	q	   : out std_logic    
  );
end component dffr_a;

signal clk            : std_logic; --Positive Edge Trigger(Align with our diagram)


begin
	
        dffr_a_map: dffr_a
	port map (clk=>clk, arst=>'0', aload=>'1', adata=>'1', d=>'1', enable=>'1', q=>q);
	

test_proc: process
begin
	     
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	
	
	wait;
	
end process;
end architecture structural;