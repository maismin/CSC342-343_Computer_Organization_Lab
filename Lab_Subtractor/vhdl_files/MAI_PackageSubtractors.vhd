library IEEE;
use     IEEE.std_logic_1164.all;

package MAI_PackageSubtractors is
  
  component mai_four_bit_subtractor
  port (  X, Y : in std_logic_vector(3 downto 0);
          Sum  : out std_logic_vector(3 downto 0);
          Cin  : in std_logic;
          Cout : out std_logic;
          V    : out std_logic;
          N    : out std_logic;
          Z    : out std_logic);
  end component;
  
  component mai_eight_bit_add_sub
  port ( X, Y : in std_logic_vector(7 downto 0);
         SEL  : in std_logic;   -- 1 for subtract, 0 for add
         SUM  : out std_logic_vector(7 downto 0);
         Cout : out std_logic;
         V    : out std_logic;
         N    : out std_logic;
         Z    : out std_logic);
  end component; 
  
end package MAI_PackageSubtractors;

