-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_c_seg is
  port (  X : in std_logic_vector(3 downto 0);
          C : out std_logic);
end mai_c_seg;

-- architecture
architecture data_flow of mai_c_seg is
  begin
    C <= (not X(2)) and X(1) and (not X(0));
end data_flow;