library IEEE;
use IEEE.std_logic_1164.all; -- std_logic

entity or_gate_12to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11 : in std_logic;
    z    : out std_logic
  );
end or_gate_12to1_s;
  
architecture or_gate_12to1_str of or_gate_12to1_s is
  signal or_so_l0_0, or_so_l0_1, or_so_l0_2, or_so_l0_3, or_so_l0_4, or_so_l0_5, or_so_l0_6 : std_logic;
  signal or_so_l1_0, or_so_l1_1, or_so_l1_2 : std_logic;
  signal or_so_l2_0, or_so_l3_0 : std_logic;  
begin 

-- zero level
  or_g_l1_0 : entity work.or_gate
    port map(x_0, x_1, or_so_l0_0);                  

  or_g_l1_1 : entity work.or_gate
    port map(x_2, x_3, or_so_l0_1); 

  or_g_l1_2 : entity work.or_gate
    port map(x_4, x_5, or_so_l0_2);

  or_g_l1_3 : entity work.or_gate
    port map(x_6, x_7, or_so_l0_3);    

  or_g_l1_4 : entity work.or_gate
    port map(x_8, x_9, or_so_l0_4); 

  or_g_l1_5 : entity work.or_gate
    port map(x_10, x_11, or_so_l0_5); 
-- end zero level

-- first level
  or_g_l2_0 : entity work.or_gate
    port map(or_so_l0_0, or_so_l0_1, or_so_l1_0);

  or_g_l2_1 : entity work.or_gate
    port map(or_so_l0_2, or_so_l0_3, or_so_l1_1);      

  or_g_l2_2 : entity work.or_gate
    port map(or_so_l0_4, or_so_l0_5, or_so_l1_2); 
-- end first level    

-- second level
  or_g_l3_1 : entity work.or_gate
    port map(or_so_l1_0, or_so_l1_1, or_so_l2_0);      
-- end second level

-- third level
  or_g_l4_0 : entity work.or_gate
    port map(or_so_l1_2, or_so_l2_0, z);      
end architecture or_gate_12to1_str;

