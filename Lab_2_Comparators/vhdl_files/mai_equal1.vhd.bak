-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_equal1 is
  port (  I0, I1    : in std_logic;
          EQ, EQNOT : out std_logic);
end mai_equal1;

-- architecture 
architecture arch of mai_equal1 is
  
  -- intermediate signal declaration
  signal p0, p1, p2 : std_logic;
begin
  EQ <= p2;
  EQNOT <= not p2;
  p0 <= (not I0) and (not I1);
  p1 <= I0 and I1;
  p2 <= p0 or p1;
end arch;