-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_2to1_8bit_mux is
  port( SEL     : in std_logic;
        Y, Ynot : in std_logic_vector(7 downto 0);
        MUX_OUT : out std_logic_vector(7 downto 0));
end mai_2to1_8bit_mux;

-- architecture
architecture data_flow of mai_2to1_8bit_mux is
  begin
    with SEL select
      MUX_OUT <= Y when '1',
                 Ynot when '0',
                 "00000000" when others;
end data_flow;
