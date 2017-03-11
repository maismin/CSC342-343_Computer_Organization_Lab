-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_a_seg is
  port (  X : in std_logic_vector(3 downto 0);
          A : out std_logic);
end mai_a_seg;

-- architecture
architecture data_flow of mai_a_seg is
  begin
    A <= (X(2) and (not X(1)) and (not X(0))) or ((not X(3)) and (not X(2)) and (not X(1)) and X(0));
end data_flow;