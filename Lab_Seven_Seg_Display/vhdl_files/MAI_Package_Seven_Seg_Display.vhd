-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- package declaration
package MAI_Package_Seven_Seg_Display is
  component Mai_Seven_Seg_Display
  port (  X       : in std_logic_vector(3 downto 0);
          DISPLAY : out std_logic_vector(6 downto 0));
  end component;
end package MAI_Package_Seven_Seg_Display;