library IEEE;
use IEEE.std_logic_1164.all;

entity mai_equal1 is
  port (  I0, I1  : in std_logic;
          EQ      : out std_logic);
end mai_equal1;

architecture arch of mai_equal1 is
    signal p0, p1 : std_logic;
    begin
      EQ <= p0 or p1;
      p0 <= (not I0) and (not I1);
      p1 <= I0 and I1;
end arch;