-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_one_bit_half_adder is
  port (  X, Y      : in std_logic;
          Sum, Cout : out std_logic);
end mai_one_bit_half_adder;

-- architecture
architecture arch of mai_one_bit_half_adder is
begin
  Sum <= X xor Y;
  Cout <= X and Y;
end arch;