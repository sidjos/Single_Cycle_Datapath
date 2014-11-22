library ieee;
use ieee.std_logic_1164.all; 
use work.eecs361_gates.all;

entity full_adder is
    port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        Sum : out std_logic;
        Cout : out std_logic 
        );
end full_adder;

architecture structural of full_adder is
    signal fa_xor, fa_and1, fa_and2 : std_logic; 
    
    begin
    xor1: xor_gate port map ( A, B, fa_xor);
    xor2: xor_gate port map ( fa_xor, Cin, Sum);
    and1: and_gate port map ( A, B, fa_and1);
    and2: and_gate port map (fa_xor, Cin, fa_and2);
    or1: or_gate port map (fa_and1, fa_and2, Cout);   
    end structural; 
        
