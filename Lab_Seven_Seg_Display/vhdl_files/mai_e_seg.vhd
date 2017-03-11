-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_e_seg is
  port (  X : in std_logic_vector(3 downto 0);
          E : out std_logic);
end mai_e_seg;

-- architecture
architecture data_flow of mai_e_seg is
  begin
    E <= X(0) or (X(2) and (not X(1)));
end data_flow;