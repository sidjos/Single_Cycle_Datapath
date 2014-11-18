library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity reg_32_demo is
	port (
		A   	     : out std_logic_vector(31 downto 0);
  		B            : out std_logic_vector(31 downto 0)
		--mux0test   	 : out std_logic_vector(31 downto 0); for testing
    		--mux1test  	 : out std_logic_vector(31 downto 0)  for testing
	);
end reg_32_demo;

architecture structural of reg_32_demo is

component reg_32 is
  port (
    clk          : in  std_logic; --Positive Edge Trigger(Align with our diagram)
    regwr        : in  std_logic;
    rw 		 : in std_logic_vector(4 downto 0);
    ra 		 : in std_logic_vector(4 downto 0);
    rb 		 : in std_logic_vector(4 downto 0);
    input	 : in std_logic_vector(31 downto 0);
    A   	 : out std_logic_vector(31 downto 0);
    B  		 : out std_logic_vector(31 downto 0)
    --mux0test   	 : out std_logic_vector(31 downto 0); for testing
    --mux1test  	 : out std_logic_vector(31 downto 0)  for testing
  
    
  );
end component reg_32;

signal clk            : std_logic; --Positive Edge Trigger(Align with our diagram)
signal regwr          : std_logic;
signal rw	      : std_logic_vector(4 downto 0);
signal ra 	      : std_logic_vector(4 downto 0);
signal rb	      : std_logic_vector(4 downto 0);
signal input	      : std_logic_vector(31 downto 0);
signal inbus          : std_logic_vector(48 downto 0);

begin
	
        reg_32_map: reg_32
	port map (clk=>clk, regwr=>regwr, rw=>rw, ra=>ra, rb=>rb, input=>input, A=>A, B=>B);
                 --,mux0test=>mux0test, mux1test=>mux1test); for testing

	clk <= inbus(48);
	regwr <= inbus(47);
	rw<= inbus(46 downto 42);
	ra<= inbus(41 downto 37);
	rb<= inbus(36 downto 32);
	input<= inbus(31 downto 0);
	

test_proc: process
begin
	        --CRwwwwwaaaaabbbbbIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
		--Write
	inbus <= "0100000000000000000000000000000000000000000000001";
	wait for 5 ns;
	inbus <= "1100000000000000000000000000000000000000000000001";
	wait for 5 ns;

		--Read
	inbus <= "0000000000000000000000000000000000000000000000001";
	wait for 5 ns;
	inbus <= "1000000000000000000000000000000000000000000000001";
	wait for 5 ns;

		--Write
	inbus <= "0110000000000000000000000000000000000000000000010";
	wait for 5 ns;
	inbus <= "1110000000000000000000000000000000000000000000010";
	wait for 5 ns;

		--Read
		--CRwwwwwaaaaabbbbbIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
	inbus <= "0000000000001000000000000000000000000000000000001";
	wait for 5 ns;
	inbus <= "1000000000001000000000000000000000000000000000001";
	wait for 5 ns;

	
	wait;
	
end process;
end architecture structural;
