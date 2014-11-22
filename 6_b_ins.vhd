library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity ins is
	port (
		rst:	in std_logic;
		imm16: 	in std_logic_vector(15 downto 0);
		clk: 	in std_logic; --Negative Edge Trigger
		branch: in std_logic;
		zero:	in std_logic;
		instruction: out std_logic_vector ( 31 downto 0)
	     );
	
end ins;

architecture structural of ins is
signal mux0: std_logic_vector(31 downto 0);
signal mux1: std_logic_vector(31 downto 0);
signal fulladder0: std_logic_vector(31 downto 0);
signal fulladder0_cout: std_logic;
signal fulladder1: std_logic_vector(31 downto 0);
signal fulladder1_cout: std_logic;
signal not_clk: std_logic;
signal pc0: std_logic_vector(31 downto 0);
signal nPC_sel: std_logic;

begin
	--PC Ext (sign extension & multiply by 4)
	mux0_map:	mux_32 port map (sel=>imm16(15), src0(31 downto 18)=>B"00000000000000",src0(17 downto 2)=>imm16,src0(1 downto 0)=>B"00", 
						         src1(31 downto 18)=>B"11111111111111",src1(17 downto 2)=>imm16,src1(1 downto 0)=>B"00",z=>mux0);

	--2 Adders
	 fulladder0_map:	fulladder_32 port map(x=>mux0, y=>fulladder1, cin=>'0', cout=>fulladder0_cout, z=>fulladder0);
	
	fulladder1_map:	fulladder_32 port map(x=>B"00000000000000000000000000000100", y=>pc0, cin=>'0',
					      cout=>fulladder1_cout, z=>fulladder1);

	--1 Mux
	and0_map:	and_gate port map (x=>zero, y=>branch, z=>nPC_sel);
	mux1_map:	mux_32 port map (sel=>nPC_sel, src0=>fulladder1, src1=>fulladder0, z=>mux1);

	--PC(starting with 0x00400020)
	not0_map:	not_gate port map (x=>clk,z=>not_clk);

	dff0_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(0));
	dff1_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(1));
	dff2_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(2));
	dff3_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(3));
	dff4_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(4));
	dff5_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'1', d=>mux1(0), enable=>'1',q=>pc0(5));
	dff6_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(6));
	dff7_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(7));

	dff8_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(8));
	dff9_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(9));
	dff10_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(10));
	dff11_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(11));
	dff12_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(12));
	dff13_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(13));
	dff14_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(14));
	dff15_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(15));

	dff16_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(16));
	dff17_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(17));
	dff18_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(18));
	dff19_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(19));
	dff20_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(20));
	dff21_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(21));
	dff22_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'1', d=>mux1(0), enable=>'1',q=>pc0(22));
	dff23_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(23));

	dff24_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(24));
	dff25_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(25));
	dff26_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(26));
	dff27_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(27));
	dff28_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(28));
	dff29_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(29));
	dff30_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(30));
	dff31_map:	dffr_a	port map (clk=>not_clk, arst=>'0',aload=>rst, adata=>'0', d=>mux1(0), enable=>'1',q=>pc0(31));

	--SRAM
	sram0_map:	sram 	
			generic map (mem_file => "unsigned_sum.dat")
			port map (cs=>'1',oe=>'1',we=>'0',addr=>pc0,
					  din=>B"00000000000000000000000000000000",
					  dout=>instruction);

end architecture structural;
