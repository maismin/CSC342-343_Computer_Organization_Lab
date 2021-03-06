-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_Package_7_Seg_A_to_G.all;

-- entity declaration
entity Mai_Seven_Seg_Display is
  port (  X       : in std_logic_vector(3 downto 0);
          DISPLAY : out std_logic_vector(6 downto 0));
end Mai_Seven_Seg_Display;

architecture structural of Mai_Seven_Seg_Display is
  begin
    A_Seg : mai_a_seg port map (X => X, A => DISPLAY(0));
    B_Seg : mai_b_seg port map (X => X, B => DISPLAY(1));
    C_Seg : mai_c_seg port map (X => X, C => DISPLAY(2));
    D_Seg : mai_d_seg port map (X => X, D => DISPLAY(3));
    E_Seg : mai_e_seg port map (X => X, E => DISPLAY(4));
    F_Seg : mai_f_seg port map (X => X, F => DISPLAY(5));
    G_Seg : mai_g_seg port map (X => X, G => DISPLAY(6));   
end structural;