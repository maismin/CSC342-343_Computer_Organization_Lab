-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- package declaration
package MAI_Package_7_Seg_A_to_G is
  component mai_a_seg 
  port (  X : in std_logic_vector(3 downto 0);
          A : out std_logic);
  end component;
  
  component mai_b_seg 
  port (  X : in std_logic_vector(3 downto 0);
          B : out std_logic);
  end component;
  
  component mai_c_seg 
  port (  X : in std_logic_vector(3 downto 0);
          C : out std_logic);
  end component;
  
  component mai_d_seg 
  port (  X : in std_logic_vector(3 downto 0);
          D : out std_logic);
  end component;
  
  component mai_e_seg 
  port (  X : in std_logic_vector(3 downto 0);
          E : out std_logic);
  end component;
  
  component mai_f_seg 
  port (  X : in std_logic_vector(3 downto 0);
          F : out std_logic);
  end component;
  
  component mai_g_seg 
  port (  X : in std_logic_vector(3 downto 0);
          G : out std_logic);
  end component;
end package MAI_Package_7_Seg_A_to_G;