-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate_n is
  generic (
    n   : integer
  );
  port (
    x   : in  std_logic_vector(n-1 downto 0);
    y   : in  std_logic_vector(n-1 downto 0);
    z   : out std_logic_vector(n-1 downto 0)
  );
end xnor_gate_n;

architecture dataflow of xnor_gate_n is
begin
  z <= x xnor y;
end dataflow;
