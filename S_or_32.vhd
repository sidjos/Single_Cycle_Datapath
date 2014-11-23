

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity or32_S is 
   port(
       
ip0 : in std_logic;
ip1 : in std_logic;
ip2 : in std_logic;
ip3 : in std_logic;
ip4 : in std_logic;
ip5 : in std_logic;
ip6 : in std_logic;
ip7 : in std_logic;
ip8 : in std_logic;
ip9 : in std_logic;
ip10 : in std_logic;
ip11 : in std_logic;
ip12 : in std_logic;
ip13 : in std_logic;
ip14 : in std_logic;
ip15 : in std_logic;
ip16 : in std_logic;
ip17 : in std_logic;
ip18 : in std_logic;
ip19 : in std_logic;
ip20 : in std_logic;
ip21 : in std_logic;
ip22 : in std_logic;
ip23 : in std_logic;
ip24 : in std_logic;
ip25 : in std_logic;
ip26 : in std_logic;
ip27 : in std_logic;
ip28 : in std_logic;
ip29 : in std_logic;
ip30 : in std_logic;
ip31 : in std_logic;
       op: out std_logic
       );
end or32_S;

architecture structural of or32_S is
    signal or_zero, ip: std_logic_vector ( 31 downto 0);
    
    begin 
        
ip <= ip0  & ip1  & ip2  & ip3  & ip4  & ip5  & ip6  & ip7  & ip8  & ip9  & ip10  & ip11  & ip12  & ip13  & ip14  & ip15  & ip16  & ip17  & ip18  & ip19  & ip20  & ip21  & ip22  & ip23  & ip24  & ip25  & ip26  & ip27  & ip28  & ip29  & ip30  & ip31 ;

            or32: for i in 0 to 31 generate
            begin
        
                      or_0: if i = 0 generate
                      begin 
                      zero_implementation: or_gate port map ('0', ip(i), or_zero(i)); 
                  end generate or_0; 
                  
                      or_n: if ((i>0) and (i<31)) generate 
                      begin
                      zero_implementation: or_gate port map (or_zero(i-1), ip(i), or_zero(i));
              end generate or_n;
                
             end generate or32;   
    
    op <= or_zero(30);

end structural ; 
