library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity sync_s is
	port (
		clk: 	in std_logic;
		busW_in: in std_logic_vector (31 downto 0);
      busW_out: out std_logic_vector (31 downto 0)
	     );
end sync_s;

architecture structural of sync_s is 
 
begin
    
 dff0_map:	dffr	port map ( clk, busW_in(0), busW_out(0));
 dff1_map:	dffr	port map ( clk, busW_in(1), busW_out(1));
 dff2_map:	dffr	port map ( clk, busW_in(2), busW_out(2));
 dff3_map:	dffr	port map ( clk, busW_in(3), busW_out(3));
 dff4_map:	dffr	port map ( clk, busW_in(4), busW_out(4));
 dff5_map:	dffr	port map ( clk, busW_in(5), busW_out(5));
 dff6_map:	dffr	port map ( clk, busW_in(6), busW_out(6));
 dff7_map:	dffr	port map ( clk, busW_in(7), busW_out(7));

 dff8_map:	dffr	port map ( clk, busW_in(8), busW_out(8));
 dff9_map:	dffr	port map ( clk, busW_in(9), busW_out(9));
 dff10_map:	dffr	port map ( clk, busW_in(10), busW_out(10));
 dff11_map:	dffr	port map ( clk, busW_in(11), busW_out(11));
 dff12_map:	dffr	port map ( clk, busW_in(12), busW_out(12));
 dff13_map:	dffr	port map ( clk, busW_in(13), busW_out(13));
 dff14_map:	dffr	port map ( clk, busW_in(14), busW_out(14));
 dff15_map:	dffr	port map ( clk, busW_in(15), busW_out(15));

 dff16_map:	dffr	port map ( clk, busW_in(16), busW_out(16));
 dff17_map:	dffr	port map ( clk, busW_in(17), busW_out(17));
 dff18_map:	dffr	port map ( clk, busW_in(18), busW_out(18));
 dff19_map:	dffr	port map ( clk, busW_in(19), busW_out(19));
 dff20_map:	dffr	port map ( clk, busW_in(20), busW_out(20));
 dff21_map:	dffr	port map ( clk, busW_in(21), busW_out(21));
 dff22_map:	dffr	port map ( clk, busW_in(22), busW_out(22));
 dff23_map:	dffr	port map ( clk, busW_in(23), busW_out(23));

 dff24_map:	dffr	port map ( clk, busW_in(24), busW_out(24));
 dff25_map:	dffr	port map ( clk, busW_in(25), busW_out(25));
 dff26_map:	dffr	port map ( clk, busW_in(26), busW_out(26));
 dff27_map:	dffr	port map ( clk, busW_in(27), busW_out(27));
 dff28_map:	dffr	port map ( clk, busW_in(28), busW_out(28));
 dff29_map:	dffr	port map ( clk, busW_in(29), busW_out(29));
 dff30_map:	dffr	port map ( clk, busW_in(30), busW_out(30));
 dff31_map:	dffr	port map ( clk, busW_in(31), busW_out(31));
 
 end structural; 
 