library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity datamem is
    port (
        clk : in std_logic;
        MemWr : in std_logic; 
        ALU_Output : in std_logic_vector ( 31 downto 0);
        busB_in   : in std_logic_vector ( 31 downto 0);
        Data_Out : out std_logic_vector ( 31 downto 0)
        );
end datamem;

architecture structural of datamem is
    signal MemWr_out: std_logic;
    
    begin
        
    memory_and: and_gate port map (clk, MemWr, MemWr_out);
    
datamem_SRAM: sram	generic map (mem_file => "sort_corrected_branch.dat")
                 port map (cs=>'1', oe=>'1', we=>MemWr_out,addr=>ALU_Output, din=>busB_in, dout=>Data_Out);
    
end structural;
