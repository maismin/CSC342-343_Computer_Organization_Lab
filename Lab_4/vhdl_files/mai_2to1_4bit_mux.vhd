-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_2to1_4bit_mux is
  port( SEL     : in std_logic;
        A, B : in std_logic_vector(3 downto 0);
        MUX_OUT : out std_logic_vector(3 downto 0));
end mai_2to1_4bit_mux;

-- architecture
architecture data_flow of mai_2to1_4bit_mux is
  begin
    with SEL select
      MUX_OUT <= A when '1',
                 B when '0',
                 "0000" when others;
end data_flow;
