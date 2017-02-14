-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_two_bit_equal is
  port (  A, B      : in std_logic_vector(1 downto 0);
          EQ, EQNOT : out std_logic);
end mai_two_bit_equal;

-- architecture
architecture arch of mai_two_bit_equal is
  -- intermediate signal declaration
  signal p0, p1, p2, p3, p4 : std_logic;
begin
  EQ <= p4;
  EQNOT <= not p4;
  p0 <= (A(1) and B(1)) and (A(0) and B(0));
  p1 <= (A(1) and B(1)) and (not (A(0) or B(0)));
  p2 <= (not (A(1) or B(1))) and (A(0) and B(0));
  p3 <= (not (A(1) or B(1))) and (not (A(0) or B(0)));
  p4 <= p0 or p1 or p2 or p3;
end arch;