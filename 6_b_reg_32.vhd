library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity reg_32 is
    
      port (
        clk   : in std_logic;
        regwr        : in  std_logic;
        RegDst      : in std_logic;
        rs 		 : in std_logic_vector(4 downto 0);
        rt 		 : in std_logic_vector(4 downto 0);
        rd 		 : in std_logic_vector(4 downto 0);
        input	 : in std_logic_vector(31 downto 0);
        A   	 : out std_logic_vector(31 downto 0);
        B  		 : out std_logic_vector(31 downto 0)
      );
end reg_32;



architecture structural of reg_32 is
<<<<<<< HEAD
    
component mux_5_S is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector (4 downto 0);
	src1  :	in	std_logic_vector (4 downto 0);
	z	  : out std_logic_vector ( 4 downto 0)
  );
end component;

signal mux0: std_logic_vector(31 downto 0);
signal mux1: std_logic_vector(31 downto 0);
signal busW_out : std_logic_vector (31 downto 0);
signal RegWr_out: std_logic;
signal Rw_out, Rw: std_logic_vector (4 downto 0);

begin
   
	mux_rs_rt_rw: mux_5_S port map ( RegDst, Rt, Rd, Rw);
	
	 dff0_map:	dffr	port map ( clk, input(0), busW_out(0));
    dff1_map:	dffr	port map ( clk, input(1), busW_out(1));
    dff2_map:	dffr	port map ( clk, input(2), busW_out(2));
    dff3_map:	dffr	port map ( clk, input(3), busW_out(3));
    dff4_map:	dffr	port map ( clk, input(4), busW_out(4));
    dff5_map:	dffr	port map ( clk, input(5), busW_out(5));
    dff6_map:	dffr	port map ( clk, input(6), busW_out(6));
    dff7_map:	dffr	port map ( clk, input(7), busW_out(7));
   
    dff8_map:	dffr	port map ( clk, input(8), busW_out(8));
    dff9_map:	dffr	port map ( clk, input(9), busW_out(9));
    dff10_map:	dffr	port map ( clk, input(10), busW_out(10));
    dff11_map:	dffr	port map ( clk, input(11), busW_out(11));
    dff12_map:	dffr	port map ( clk, input(12), busW_out(12));
    dff13_map:	dffr	port map ( clk, input(13), busW_out(13));
    dff14_map:	dffr	port map ( clk, input(14), busW_out(14));
    dff15_map:	dffr	port map ( clk, input(15), busW_out(15));
   
    dff16_map:	dffr	port map ( clk, input(16), busW_out(16));
    dff17_map:	dffr	port map ( clk, input(17), busW_out(17));
    dff18_map:	dffr	port map ( clk, input(18), busW_out(18));
    dff19_map:	dffr	port map ( clk, input(19), busW_out(19));
    dff20_map:	dffr	port map ( clk, input(20), busW_out(20));
    dff21_map:	dffr	port map ( clk, input(21), busW_out(21));
    dff22_map:	dffr	port map ( clk, input(22), busW_out(22));
    dff23_map:	dffr	port map ( clk, input(23), busW_out(23));
   
    dff24_map:	dffr	port map ( clk, input(24), busW_out(24));
    dff25_map:	dffr	port map ( clk, input(25), busW_out(25));
    dff26_map:	dffr	port map ( clk, input(26), busW_out(26));
    dff27_map:	dffr	port map ( clk, input(27), busW_out(27));
    dff28_map:	dffr	port map ( clk, input(28), busW_out(28));
    dff29_map:	dffr	port map ( clk, input(29), busW_out(29));
    dff30_map:	dffr	port map ( clk, input(30), busW_out(30));
    dff31_map:	dffr	port map ( clk, input(31), busW_out(31));
    
        dff32_map:	dffr	port map ( clk, Rw(0), Rw_out(0));
        dff33_map:	dffr	port map ( clk, Rw(1), Rw_out(1));
        dff34_map:	dffr	port map ( clk, Rw(2), Rw_out(2));
        dff35_map:	dffr	port map ( clk, Rw(3), Rw_out(3));
        dff36_map:	dffr	port map ( clk, Rw(4), Rw_out(4));
    
    dff37_map:	dffr	port map ( clk, RegWr, RegWr_out);
    
    
	-- ra <= rs
	-- rb <= rt
	
=======


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



	      
>>>>>>> 1287bebcec77da95fbd8f87974cf3d1b5fe9c333
		--Arrange 2 Synchronized RAM with proper connections
	mux0_map:	mux_32	 port map (sel=>RegWr_out, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>rs,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>Rw_out, z=>mux0);

	mux1_map:	mux_32	 port map (sel=>RegWr_out, src0(31 downto 5)=>B"000000000000000000000000000", src0(4 downto 0)=>rt,
					               src1(31 downto 5)=>B"000000000000000000000000000", src1(4 downto 0)=>Rw_out, z=>mux1);
	
	--mux0test <= mux0; for testing
	--mux1test <= mux1; for testing
	
	sram0_map:  	sram	
 			generic map (mem_file => "reg_init.dat")
<<<<<<< HEAD
 			port map (cs=>'1', oe=>'1', we=>regwr_out,addr=>mux0, din=>busW_out, dout=>A);

	sram1_map:  	sram	 
			generic map (mem_file => "reg_init.dat")
			port map (cs=>'1', oe=>'1', we=>regwr_out,addr=>mux1, din=>busW_out, dout=>B);
=======
 			port map (cs=>'1', oe=>'1', we=>regwr,addr=>mux0, din=>input, dout=>KKKKK);

	sram1_map:  	sram	 
			generic map (mem_file => "reg_init.dat")
			port map (cs=>'1', oe=>'1', we=>regwr,addr=>mux1, din=>input, dout=>PPPPP);
        B <= PPPPP;
>>>>>>> 1287bebcec77da95fbd8f87974cf3d1b5fe9c333
	
end architecture structural;
