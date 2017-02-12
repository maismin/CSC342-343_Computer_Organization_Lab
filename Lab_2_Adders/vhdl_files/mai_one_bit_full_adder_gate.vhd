-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_one_bit_full_adder_gate is
  port (  X, Y, Cin : in std_logic;
          Sum, Cout : out std_logic);
end mai_one_bit_full_adder_gate;

-- architecture
architecture arch of mai_one_bit_full_adder_gate is
begin
  Sum <= X xor Y xor Cin;
  Cout <= (X and Y) or (X and Cin) or (Y and Cin);
end arch;

