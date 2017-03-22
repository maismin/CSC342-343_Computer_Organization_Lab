-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_one_bit_full_adder_g_p is
  port (  X, Y, Cin : in std_logic;
          Sum, G, P : out std_logic);
end mai_one_bit_full_adder_g_p;

-- architecture
architecture arch of mai_one_bit_full_adder_g_p is
begin
  Sum <= X xor Y xor Cin;
  G <= X and Y;
  P <= X or Y;
end arch;
