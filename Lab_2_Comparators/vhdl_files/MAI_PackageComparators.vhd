library IEEE;
use     IEEE.std_logic_1164.all;

package MAI_PackageComparators is
  
  component mai_equal1
  port (  I0, I1    : in std_logic;
          EQ, EQNOT : out std_logic);
  end component;

  component mai_two_bit_equal
  port (  A, B      : in std_logic_vector(1 downto 0);
          EQ, EQNOT : out std_logic);
  end component;
  
  component mai_two_bit_equal_port
  port (  A, B  : in std_logic_vector(1 downto 0);
          EQ, EQNOT  : out std_logic);
  end component;
  
  component mai_eight_bit_equal_port
  port (  A, B      : in std_logic_vector(7 downto 0);
          EQ, EQNOT : out std_logic);
  end component;
  
end package MAI_PackageComparators;
