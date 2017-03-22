library IEEE;
use     IEEE.std_logic_1164.all;

package MAI_PackageCLA is
  
  component mai_CLA_4_Bit_Logic
  port (  G, P         : in std_logic_vector(3 downto 0);
          Cin          : in std_logic;
          Cout         : out std_logic_vector(2 downto 0);
          CGOut, CPout : out std_logic);
  end component;
  
end package MAI_PackageCLA;
