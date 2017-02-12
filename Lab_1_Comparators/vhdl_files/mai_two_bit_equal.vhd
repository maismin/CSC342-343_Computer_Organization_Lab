library IEEE;
use IEEE.std_logic_1164.all;

entity mai_two_bit_equal is
  port (  a, b  : in std_logic_vector(1 downto 0);
          aeqb  : out std_logic);
end mai_two_bit_equal;

architecture arch of mai_two_bit_equal is
  signal p0, p1, p2, p3 : std_logic;
  begin
    aeqb <= p0 or p1 or p2 or p3;
    p0 <= (a(1) and b(1)) and (a(0) and b(0));
    p1 <= (a(1) and b(1)) and (not (a(0) or b(0)));
    p2 <= (not (a(1) or b(1))) and (a(0) and b(0));
    p3 <= (not (a(1) or b(1))) and (not (a(0) or b(0)));
end arch;