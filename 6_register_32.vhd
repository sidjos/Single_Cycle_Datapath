library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity register_32 is
    
      port (
        clk   : in std_logic;
        rst: in std_logic;
        WrEn      : in std_logic;
        ReadEn  : in std_logic;
        input	 : in std_logic_vector(31 downto 0);
        output   	 : out std_logic_vector(31 downto 0);
      );
end register_32;

architecture structural of register_32 is

begin
   
	dff0_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(0), enable=>WrEn,q=>output_mem(0));
	dff1_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(1), enable=>WrEn,q=>output_mem(1));
	dff2_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(2), enable=>WrEn,q=>output_mem(2));
	dff3_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(3), enable=>WrEn,q=>output_mem(3));
	dff4_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(4), enable=>WrEn,q=>output_mem(4));
	dff5_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(5), enable=>WrEn,q=>output_mem(5));
	dff6_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(6), enable=>WrEn,q=>output_mem(6));
	dff7_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(7), enable=>WrEn,q=>output_mem(7));

	dff8_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(8), enable=>WrEn,q=>output_mem(8));
	dff9_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(9), enable=>WrEn,q=>output_mem(9));
	dff10_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(10), enable=>WrEn,q=>output_mem(10));
	dff11_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(11), enable=>WrEn,q=>output_mem(11));
	dff12_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(12), enable=>WrEn,q=>output_mem(12));
	dff13_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(13), enable=>WrEn,q=>output_mem(13));
	dff14_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(14), enable=>WrEn,q=>output_mem(14));
	dff15_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(15), enable=>WrEn,q=>output_mem(15));

	dff16_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(16), enable=>WrEn,q=>output_mem(16));
	dff17_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(17), enable=>WrEn,q=>output_mem(17));
	dff18_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(18), enable=>WrEn,q=>output_mem(18));
	dff19_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(19), enable=>WrEn,q=>output_mem(19));
	dff20_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(20), enable=>WrEn,q=>output_mem(20));
	dff21_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(21), enable=>WrEn,q=>output_mem(21));
	dff22_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(22), enable=>WrEn,q=>output_mem(22));
	dff23_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(23), enable=>WrEn,q=>output_mem(23));

	dff24_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(24), enable=>WrEn,q=>output_mem(24));
	dff25_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(25), enable=>WrEn,q=>output_mem(25));
	dff26_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(26), enable=>WrEn,q=>output_mem(26));
	dff27_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(27), enable=>WrEn,q=>output_mem(27));
	dff28_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(28), enable=>WrEn,q=>output_mem(28));
	dff29_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(29), enable=>WrEn,q=>output_mem(29));
	dff30_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(30), enable=>WrEn,q=>output_mem(30));
	dff31_map:	dffr_a	port map (clk=>clk, arst=>rst,aload=>'0', adata=>'0', d=>input(31), enable=>WrEn,q=>output_mem(31));

generate_op:
    for i in 0 to 31 generate
        and0_map : and_gate port map (output_mem(i), ReadEn, output(i));
    end generate generate_op;

end architecture structural;