library IEEE;
use     IEEE.std_logic_1164.all;

package MAI_PackageMux is
  
  component mai_2to1_8bit_mux
  port( SEL     : in std_logic;
        Y, Ynot : in std_logic_vector(7 downto 0);
        MUX_OUT : out std_logic_vector(7 downto 0));
end component;
  
end package MAI_PackageMux;
