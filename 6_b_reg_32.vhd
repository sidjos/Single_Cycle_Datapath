library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity reg_32 is

  port (
    --clk          : in  std_logic; --Positive Edge Trigger(Align with our diagram)
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


component alu is 
   port(
       ctrl: in std_logic_vector (3 downto 0);
       A : in std_logic_vector(31 downto 0);
       B: in std_logic_vector ( 31 downto 0);
       cout: out std_logic; 
       ovf: out std_logic; 
       ze: out std_logic;
       R: out std_logic_vector(31 downto 0)
       );
end component; 

signal mux0: std_logic_vector(31 downto 0);
signal mux1: std_logic_vector(31 downto 0);
signal sellll, XXXXX, YYYYY: std_logic;
signal KKKKK,PPPPP: std_logic_vector(31 downto 0);

begin



alu000_map: alu port map ( ctrl=>B"0001", A(4 downto 0)=>rw, A(31 downto 5)=>B"000000000000000000000000000", 
					  B(4 downto 0)=>ra, B(31 downto 5)=>B"000000000000000000000000000",
										ze=>XXXXX);


alu001_map: alu port map ( ctrl=>B"0001", A(4 downto 0)=>ra, A(31 downto 5)=>B"000000000000000000000000000", 
 					  
					  B(31 downto 5)=>B"000000000000000000000000000", B(4 downto 0)=>rb,
										ze=>YYYYY);
anddd_map : and_gate port map (x=>XXXXX, y=>YYYYY, z=>sellll);
muxxxxx:    mux_32 port map (sel=>sellll, src0=>KKKKK, src1=>PPPPP, z=>A);



	      
		--Arrange 2 Synchronized RAM with proper connections
	mux0_map:	mux_32	 port map (sel=>regwr, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>ra,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>rw, z=>mux0);

	mux1_map:	mux_32	 port map (sel=>regwr, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>rb,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>rw, z=>mux1);
	
	--mux0test <= mux0; for testing
	--mux1test <= mux1; for testing
	
	sram0_map:  	sram	
 			generic map (mem_file => "reg_init.dat")
 			port map (cs=>'1', oe=>'1', we=>regwr,addr=>mux0, din=>input, dout=>KKKKK);

	sram1_map:  	sram	 
			generic map (mem_file => "reg_init.dat")
			port map (cs=>'1', oe=>'1', we=>regwr,addr=>mux1, din=>input, dout=>PPPPP);
        B <= PPPPP;
	
end architecture structural;
