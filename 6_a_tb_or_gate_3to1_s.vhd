library IEEE;
use IEEE.std_logic_1164.all;
--Additional standard or custom libraries go here
entity or_gate_3to1_s_tb is
  port(
    F_tb : out std_logic
  );
end entity or_gate_3to1_s_tb;

architecture behavioral of or_gate_3to1_s_tb is
--Entity (as component) and input ports (as signals) go here
component or_gate_3to1_s is
  port (
    x_0, x_1, x_2 : in std_logic;
    z : out std_logic
  );
end component or_gate_3to1_s;
--component declaration and stimuli processes go here
  signal x_tb_0, x_tb_1, x_tb_2 :std_logic := '0';
begin
  DUT: or_gate_3to1_s
    port map(x_tb_0, x_tb_1, x_tb_2, F_tb);
    
    stimulus_x_0 : process is
    begin 
      x_tb_0 <= '0';
      wait for 80 ns; x_tb_0 <= '1';
      wait for 80 ns; x_tb_0 <= '0';
      wait;
    end process stimulus_x_0;

    stimulus_x_1 : process is
    begin 
      x_tb_1 <= '0';
      wait for 40 ns; x_tb_1 <= '1';
      wait for 40 ns; x_tb_1 <= '0';
      wait for 40 ns; x_tb_1 <= '1';      
      wait for 40 ns; x_tb_1 <= '0';
      wait for 10 ns;
      wait;
    end process stimulus_x_1;

    stimulus_x_2 : process is 
    begin 
      x_tb_2 <= '0';
      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  
      wait for 10 ns;
      wait;
    end process stimulus_x_2;       
end architecture behavioral;