library IEEE;
use IEEE.std_logic_1164.all;
--Additional standard or custom libraries go here
entity nor_gate_32to1_s_tb is
  port(
    F_tb : out std_logic
  );
end entity nor_gate_32to1_s_tb;

architecture behavioral of nor_gate_32to1_s_tb is
--Entity (as component) and input ports (as signals) go here
component nor_gate_32to1_s is
  port (
    x   : in std_logic_vector(31 downto 0);
    z   : out std_logic
  );
end component nor_gate_32to1_s;
--component declaration and stimuli processes go here
  signal x_tb : std_logic_vector(31 downto 0) := X"00_00_00_00";
begin
  DUT: nor_gate_32to1_s
    port map(x_tb, F_tb);
    
    stimulus_x : process is
    begin 
      x_tb <= X"00_00_00_00"; wait for 10 ns;
      x_tb <= X"00_00_00_0F"; wait for 10 ns;
      x_tb <= X"00_00_0F_00"; wait for 10 ns;
      x_tb <= X"00_00_F0_00"; wait for 10 ns;
      x_tb <= X"00_0F_00_00"; wait for 10 ns;            
      x_tb <= X"0F_00_00_00"; wait for 10 ns;            
      x_tb <= X"F0_00_00_00"; wait for 10 ns;                        
      wait;
    end process stimulus_x;       
end architecture behavioral;