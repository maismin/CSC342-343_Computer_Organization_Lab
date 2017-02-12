-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_eight_bit_equal_port is
  port (  A, B  : in std_logic_vector(7 downto 0);
          EQ                      : out std_logic);
end mai_eight_bit_equal_port;

-- architecture
architecture arch of mai_eight_bit_equal_port is
  -- Component --------------------------------
  
  -- 1 bit comparator
  component mai_equal1
  port (  I0, I1  : in std_logic;
          EQ      : out std_logic);
  end component;
  
  -- intermediate signal declaration
  signal e  : std_logic_vector(7 downto 0); -- vector holds results of comparator of respective indexes 
begin
  H0: mai_equal1 port map (I0 => A(0), I1 => B(0), EQ => e(0));
  H1: mai_equal1 port map (I0 => A(1), I1 => B(1), EQ => e(1));
  H2: mai_equal1 port map (I0 => A(2), I1 => B(2), EQ => e(2));
  H3: mai_equal1 port map (I0 => A(3), I1 => B(3), EQ => e(3));
  H4: mai_equal1 port map (I0 => A(4), I1 => B(4), EQ => e(4));
  H5: mai_equal1 port map (I0 => A(5), I1 => B(5), EQ => e(5));
  H6: mai_equal1 port map (I0 => A(6), I1 => B(6), EQ => e(6));
  H7: mai_equal1 port map (I0 => A(7), I1 => B(7), EQ => e(7));
  
  EQ <= e(0) and e(1) and e(2) and e(3) and e(4) and e(5) and e(6) and e(7);
end arch;
