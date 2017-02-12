-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_two_bit_equal_port is
  port (  a, b  : in std_logic_vector(1 downto 0);
          aeqb  : out std_logic);
end mai_two_bit_equal_port;

-- architecture
architecture arch of mai_two_bit_equal_port is
  -- Component --------------------------------
  
  -- 1 Bit Comparator -------------------------
  component mai_equal1
  port (  I0, I1  : in std_logic;
          EQ      : out std_logic);
  end component;
  
  -- intermediate signal declaration
  signal e0, e1 : std_logic;
  
begin
  H1: mai_equal1 port map (I0 => a(0), I1 => b(0), EQ => e0);
  H2: mai_equal1 port map (I0 => a(1), I1 => b(1), EQ => e1);
    
  aeqb <= e0 and e1;
end arch;

