-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageComparators.all;

-- entity
entity mai_eight_bit_equal_port is
  port (  A, B      : in std_logic_vector(7 downto 0);
          EQ, EQNOT : out std_logic);
end mai_eight_bit_equal_port;

-- architecture
architecture arch of mai_eight_bit_equal_port is
  
  -- intermediate signal declaration
  signal e, en  : std_logic_vector(7 downto 0);
begin
  H0: mai_equal1 port map (I0 => A(0), I1 => B(0), EQ => e(0), EQNOT => en(0));
  H1: mai_equal1 port map (I0 => A(1), I1 => B(1), EQ => e(1), EQNOT => en(1));
  H2: mai_equal1 port map (I0 => A(2), I1 => B(2), EQ => e(2), EQNOT => en(2));
  H3: mai_equal1 port map (I0 => A(3), I1 => B(3), EQ => e(3), EQNOT => en(3));
  H4: mai_equal1 port map (I0 => A(4), I1 => B(4), EQ => e(4), EQNOT => en(4));
  H5: mai_equal1 port map (I0 => A(5), I1 => B(5), EQ => e(5), EQNOT => en(5));
  H6: mai_equal1 port map (I0 => A(6), I1 => B(6), EQ => e(6), EQNOT => en(6));
  H7: mai_equal1 port map (I0 => A(7), I1 => B(7), EQ => e(7), EQNOT => en(7));
  
  EQ <= e(0) and e(1) and e(2) and e(3) and e(4) and e(5) and e(6) and e(7);
  EQNOT <= en(0) or en(1) or en(2) or en(3) or en(4) or en(5) or en(6) or en(7); 
end arch;