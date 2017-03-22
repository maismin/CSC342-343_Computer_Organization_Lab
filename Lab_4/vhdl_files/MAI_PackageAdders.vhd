library IEEE;
use     IEEE.std_logic_1164.all;

package MAI_PackageAdders is
  
  component mai_one_bit_half_adder
  port (  X, Y      : in std_logic;
          Sum, Cout : out std_logic);
  end component;
  
  component mai_one_bit_full_adder_port
  port (  X, Y, Cin : in std_logic;
          Sum, Cout : out std_logic);
  end component;
  
  component mai_one_bit_full_adder_gate
  port (  X, Y, Cin : in std_logic;
          Sum, Cout : out std_logic);
  end component;
  
  component mai_one_bit_full_adder_g_p
  port (  X, Y, Cin : in std_logic;
          Sum, G, P : out std_logic);
  end component;
  
  component mai_four_bit_full_adder
  port (  X, Y : in std_logic_vector(3 downto 0);
          Cin  : in std_logic;
          Sum  : out std_logic_vector(3 downto 0);
          Cout : out std_logic);
  end component;
  
  component mai_four_bit_CLA_adder
  port (  X, Y : in std_logic_vector(3 downto 0);
          Cin  : in std_logic;
          Sum  : out std_logic_vector(3 downto 0);
          CGout, CPout, Overflow : out std_logic);
  end component;
  
end package MAI_PackageAdders;