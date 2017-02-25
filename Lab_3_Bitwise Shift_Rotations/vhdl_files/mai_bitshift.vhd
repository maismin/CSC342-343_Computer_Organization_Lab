-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_bitshift is
  port( A     : in std_logic_vector(4 downto 0);
        RESULT: out std_logic_vector(4 downto 0));
end mai_bitshift;

-- architecture
architecture arch of mai_bitshift is
begin
  RESULT <= to_stdlogicvector(to_bitvector(A) sll 1);
end arch;