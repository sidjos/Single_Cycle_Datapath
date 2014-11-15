library IEEE;
use IEEE.std_logic_1164.all;
--Additional standard or custom libraries go here
entity and_gate_12to1_s_tb is
  port(
    F_tb : out std_logic := '0'
  );
end entity and_gate_12to1_s_tb;

architecture behavioral of and_gate_12to1_s_tb is
--Entity (as component) and input ports (as signals) go here
component and_gate_12to1_s is
  port (
    x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11   : in std_logic;
    z    : out std_logic
  );
end component and_gate_12to1_s;
--component declaration and stimuli processes go here
  signal x_tb_0, x_tb_1, x_tb_2, x_tb_3, x_tb_4, x_tb_5, x_tb_6, x_tb_7, x_tb_8, 
    x_tb_9, x_tb_10, x_tb_11 :std_logic := '0';
begin
  DUT: and_gate_12to1_s
    port map(x_tb_0, x_tb_1, x_tb_2, x_tb_3, x_tb_4, x_tb_5, x_tb_6, x_tb_7, x_tb_8, 
      x_tb_9, x_tb_10, x_tb_11, F_tb);
    
    stimulus_x_0 : process is
    begin 
      x_tb_0 <= '0';
      wait for 80 ns; x_tb_0 <= '1';
      wait for 80 ns; x_tb_0 <= '0';

      wait for 80 ns; x_tb_0 <= '1';
      wait for 80 ns; x_tb_0 <= '0';           

      wait for 80 ns; x_tb_0 <= '1';
      wait for 80 ns; x_tb_0 <= '0';

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

      wait for 40 ns; x_tb_1 <= '1';
      wait for 40 ns; x_tb_1 <= '0';
      wait for 40 ns; x_tb_1 <= '1';      
      wait for 40 ns; x_tb_1 <= '0';

      wait for 40 ns; x_tb_1 <= '1';
      wait for 40 ns; x_tb_1 <= '0';
      wait for 40 ns; x_tb_1 <= '1';      
      wait for 40 ns; x_tb_1 <= '0';

      wait for 40 ns; x_tb_1 <= '1';
      wait for 40 ns; x_tb_1 <= '0';
      wait for 40 ns; x_tb_1 <= '1';      
      wait for 40 ns; x_tb_1 <= '0';      
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

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';  

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';

      wait for 20 ns; x_tb_2 <= '1';
      wait for 20 ns; x_tb_2 <= '0';      
      wait;
    end process stimulus_x_2;

   stimulus_x_3 : process is
    begin 
      x_tb_3 <= '0';
      wait for 80 ns; x_tb_3 <= '1';
      wait for 80 ns; x_tb_3 <= '0';

      wait for 80 ns; x_tb_3 <= '1';
      wait for 80 ns; x_tb_3 <= '0';           

      wait for 80 ns; x_tb_3 <= '1';
      wait for 80 ns; x_tb_3 <= '0';

      wait for 80 ns; x_tb_3 <= '1';
      wait for 80 ns; x_tb_3 <= '0';     
      wait;
    end process stimulus_x_3;

    stimulus_x_4 : process is
    begin 
      x_tb_4 <= '0';
      wait for 40 ns; x_tb_4 <= '1';
      wait for 40 ns; x_tb_4 <= '0';
      wait for 40 ns; x_tb_4 <= '1';      
      wait for 40 ns; x_tb_4 <= '0';

      wait for 40 ns; x_tb_4 <= '1';
      wait for 40 ns; x_tb_4 <= '0';
      wait for 40 ns; x_tb_4 <= '1';      
      wait for 40 ns; x_tb_4 <= '0';

      wait for 40 ns; x_tb_4 <= '1';
      wait for 40 ns; x_tb_4 <= '0';
      wait for 40 ns; x_tb_4 <= '1';      
      wait for 40 ns; x_tb_4 <= '0';

      wait for 40 ns; x_tb_4 <= '1';
      wait for 40 ns; x_tb_4 <= '0';
      wait for 40 ns; x_tb_4 <= '1';      
      wait for 40 ns; x_tb_4 <= '0';       
      wait;
    end process stimulus_x_4;

    stimulus_x_5 : process is 
    begin 
      x_tb_5 <= '0';
      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';  

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';

      wait for 20 ns; x_tb_5 <= '1';
      wait for 20 ns; x_tb_5 <= '0';      
      wait;
    end process stimulus_x_5;

    stimulus_x_6 : process is
    begin 
      x_tb_6 <= '0';
      wait for 80 ns; x_tb_6 <= '1';
      wait for 80 ns; x_tb_6 <= '0';

      wait for 80 ns; x_tb_6 <= '1';
      wait for 80 ns; x_tb_6 <= '0';           

      wait for 80 ns; x_tb_6 <= '1';
      wait for 80 ns; x_tb_6 <= '0';

      wait for 80 ns; x_tb_6 <= '1';
      wait for 80 ns; x_tb_6 <= '0';        
      wait;
    end process stimulus_x_6;

    stimulus_x_7 : process is
    begin 
      x_tb_7 <= '0';
      wait for 40 ns; x_tb_7 <= '1';
      wait for 40 ns; x_tb_7 <= '0';
      wait for 40 ns; x_tb_7 <= '1';      
      wait for 40 ns; x_tb_7 <= '0';

      wait for 40 ns; x_tb_7 <= '1';
      wait for 40 ns; x_tb_7 <= '0';
      wait for 40 ns; x_tb_7 <= '1';      
      wait for 40 ns; x_tb_7 <= '0';

      wait for 40 ns; x_tb_7 <= '1';
      wait for 40 ns; x_tb_7 <= '0';
      wait for 40 ns; x_tb_7 <= '1';      
      wait for 40 ns; x_tb_7 <= '0';

      wait for 40 ns; x_tb_7 <= '1';
      wait for 40 ns; x_tb_7 <= '0';
      wait for 40 ns; x_tb_7 <= '1';      
      wait for 40 ns; x_tb_7 <= '0';      
      wait;
    end process stimulus_x_7;

    stimulus_x_8 : process is 
    begin 
      x_tb_8 <= '0';
      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';  

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';

      wait for 20 ns; x_tb_8 <= '1';
      wait for 20 ns; x_tb_8 <= '0';      
      wait;
    end process stimulus_x_8;

   stimulus_x_9 : process is
    begin 
      x_tb_9 <= '0';
      wait for 80 ns; x_tb_9 <= '1';
      wait for 80 ns; x_tb_9 <= '0';

      wait for 80 ns; x_tb_9 <= '1';
      wait for 80 ns; x_tb_9 <= '0';           

      wait for 80 ns; x_tb_9 <= '1';
      wait for 80 ns; x_tb_9 <= '0';

      wait for 80 ns; x_tb_9 <= '1';
      wait for 80 ns; x_tb_9 <= '0';     
      wait;
    end process stimulus_x_9;

    stimulus_x_10 : process is
    begin 
      x_tb_10 <= '0';
      wait for 40 ns; x_tb_10 <= '1';
      wait for 40 ns; x_tb_10 <= '0';
      wait for 40 ns; x_tb_10 <= '1';      
      wait for 40 ns; x_tb_10 <= '0';

      wait for 40 ns; x_tb_10 <= '1';
      wait for 40 ns; x_tb_10 <= '0';
      wait for 40 ns; x_tb_10 <= '1';      
      wait for 40 ns; x_tb_10 <= '0';

      wait for 40 ns; x_tb_10 <= '1';
      wait for 40 ns; x_tb_10 <= '0';
      wait for 40 ns; x_tb_10 <= '1';      
      wait for 40 ns; x_tb_10 <= '0';

      wait for 40 ns; x_tb_10 <= '1';
      wait for 40 ns; x_tb_10 <= '0';
      wait for 40 ns; x_tb_10 <= '1';      
      wait for 40 ns; x_tb_10 <= '0';       
      wait;
    end process stimulus_x_10;

    stimulus_x_11 : process is 
    begin 
      x_tb_11 <= '0';
      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';  

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';

      wait for 20 ns; x_tb_11 <= '1';
      wait for 20 ns; x_tb_11 <= '0';      
      wait;
    end process stimulus_x_11;    
end architecture behavioral;