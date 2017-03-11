-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_d_seg is
  port (  X : in std_logic_vector(3 downto 0);
          D : out std_logic);
end mai_d_seg;

-- architecture
architecture data_flow of mai_d_seg is
  begin
    D <= (X(2) and X(1) and X(0)) or ((not X(2)) and (not X(1)) and X(0)) or (X(2) and (not X(1)) and (not X(0)));
end data_flow;