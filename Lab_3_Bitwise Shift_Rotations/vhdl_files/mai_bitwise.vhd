-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_bitwise is
  port( A, B  : in std_logic_vector(2 downto 0);
        RESULT: out std_logic_vector(2 downto 0));
end mai_bitwise;

-- architecture
architecture arch of mai_bitwise is
begin
  RESULT <= a and b;
end arch;