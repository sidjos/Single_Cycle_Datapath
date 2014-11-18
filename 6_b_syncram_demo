library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity syncram_demo is
	port (
		dout  :	out std_logic_vector(31 downto 0)
	);
end syncram_demo;

architecture structural of syncram_demo is
component syncram is

generic (
	mem_file : string
  	);
port (
		clk   : in  std_logic;	 --Postive Edge Trigger
		cs    : in  std_logic;	 --Chip Select, 1:Turn On 2:Turn Off
		oe    :	in  std_logic;   --Output Enable
		we    :	in  std_logic;   --Write Enable
		addr  : in  std_logic_vector(31 downto 0);
		din   :	in  std_logic_vector(31 downto 0);
		dout  :	out std_logic_vector(31 downto 0)
    
     );
end component syncram;

signal	clkin   : std_logic;	 --Postive Edge Trigger
signal	csin    : std_logic;	 --Chip Select, 1:Turn On 2:Turn Off
signal	oein    : std_logic;   	 --Output Enable
signal	wein    : std_logic;   	 --Write Enable
signal	addrin  : std_logic_vector(31 downto 0);
signal	dinin   : std_logic_vector(31 downto 0);
signal	inbus   : std_logic_vector(67 downto 0);
 

begin
	
        syncram_map: syncram
	generic map (mem_file => "sort_corrected_branch.dat")
	port map (clk=>clkin, cs=>csin, oe=>oein, we=>wein, addr=>addrin, din=>dinin, dout=>dout);

	clkin <= inbus(67);
	csin <= inbus(66);
	oein <= inbus(65);
	wein <= inbus(64);
	addrin <= inbus(31 downto 0);
	dinin <= inbus(31 downto 0);
	

test_proc: process
begin
	        --CSOWA
	inbus <= "01110000000000000000000000000000000000000000000000000000000000000001";
	wait for 5 ns;
	inbus <= "11110000000000000000000000000000000000000000000000000000000000000001";
	wait for 5 ns;

	inbus <= "01100000000000000000000000000000000000000000000000000000000000000001";
	wait for 5 ns;
	inbus <= "11100000000000000000000000000000000000000000000000000000000000000001";
	wait for 5 ns;

	
	wait;
	
end process;
end architecture structural;
