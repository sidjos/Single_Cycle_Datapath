library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity reg_32 is

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
end reg_32;

architecture structural of reg_32 is
signal mux0: std_logic_vector(31 downto 0);
signal mux1: std_logic_vector(31 downto 0);

begin
	      
		--Arrange 2 Synchronized RAM with proper connections
	mux0_map:	mux_32	 port map (sel=>regwr, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>ra,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>rw, z=>mux0);

	mux1_map:	mux_32	 port map (sel=>regwr, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>rb,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>rw, z=>mux1);
	
	--mux0test <= mux0; for testing
	--mux1test <= mux1; for testing
	
	syncram0_map:  	syncram	
 			generic map (mem_file => "sort_corrected_branch.dat")
 			port map (clk=>clk, cs=>'1', oe=>'1', we=>regwr,addr=>mux0, din=>input, dout=>A);

	syncram1_map:  	syncram	 
			generic map (mem_file => "sort_corrected_branch.dat")
			port map (clk=>clk, cs=>'1', oe=>'1', we=>regwr,addr=>mux1, din=>input, dout=>B);
	
end architecture structural;
