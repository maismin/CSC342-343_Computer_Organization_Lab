-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_g_seg is
  port (  X : in std_logic_vector(3 downto 0);
          G : out std_logic);
end mai_g_seg;

-- architecture
architecture data_flow of mai_g_seg is
  begin
    G <= ((not X(3)) and (not X(2)) and (not X(1))) or (X(2) and X(1) and X(0)) ;
end data_flow;
