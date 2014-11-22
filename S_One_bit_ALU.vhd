library ieee;
use ieee.std_logic_1164.all; 
use work.eecs361_gates.all;

entity one_bit_alu is 
   port( 
       ctrl0: in std_logic;
       ctrl1: in std_logic;
       A: in std_logic;
       B: in std_logic;
       Cin : in std_logic;
       Cout: out std_logic;
       R: out std_logic);
end one_bit_alu;

architecture structural of one_bit_alu is
    
    component full_adder is
            port (
                A : in std_logic;
                B : in std_logic;
                Cin : in std_logic;
                Sum : out std_logic;
                Cout : out std_logic 
                );
        end component;
    
    component mux_4 is
        port (
         sel0	  : in	std_logic;
         sel1   : in std_logic;
         src0  :	in	std_logic;
         src1  :	in	std_logic;
         src2  : in std_logic;
         src3  : in std_logic;
         z	  : out std_logic
        );
      end component;
    
    
    signal input_B, and_output, or_output, sum_diff: std_logic; 
    
    begin
        
        --ctrl0 determines if add(0) or sub(1).
        xor1_alu: xor_gate port map (B, ctrl0, input_B);
        
        and1_alu: and_gate port map (A, B, and_output);
        or1_alu: or_gate port map (A, B, or_output);
        
        fa_alu: full_adder port map (A, input_B, Cin, sum_diff, Cout);
        
        one_bit_alu_mux: mux_4 port map ( ctrl0, ctrl1, sum_diff, sum_diff, and_output, or_output, R);
    
end structural; 

        
        
        
        