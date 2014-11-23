

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity or32_S is 
   port(
       ip0: in std_logic;
       ip1 : in std_logic;
       op: out std_logic
       );
end or32_S;

architecture structural of or32_S is
    signal or_zero: std_logic_vector ( 31 downto 0);
    
ip <= ip0  & ip1  & ip2  & ip3  & ip4  & ip5  & ip6  & ip7  & ip8  & ip9  & ip10  & ip11  & ip12  & ip13  & ip14  & ip15  & ip16  & ip17  & ip18  & ip19  & ip20  & ip21  & ip22  & ip23  & ip24  & ip25  & ip26  & ip27  & ip28  & ip29  & ip30  & ip31 ;

    begin
            or32: for i in 0 to 31 generate
            begin
        
                      or_0: if i = 0 generate
                      begin 
                      zero_implementation: or_gate port map ('0', ip(i), or_zero(i)); 
                  end generate or_0; 
                  
                      or_n: if ((i>0) and (i<31)) generate 
                      begin
                      zero_implementation: or_gate port map (or_zero(i), ip(i), or_zero(i+1));
              end generate or_n;
                
             end generate or32;   
    
    op <= or_zero(31);

end structural ; 
