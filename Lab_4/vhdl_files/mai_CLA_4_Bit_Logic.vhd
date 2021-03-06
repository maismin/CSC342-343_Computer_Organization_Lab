-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_CLA_4_Bit_Logic is
  port (  G, P         : in std_logic_vector(3 downto 0);
          Cin          : in std_logic;
          Cout         : out std_logic_vector(2 downto 0);
          CGout, CPout : out std_logic);
end mai_CLA_4_Bit_Logic;

-- architecture
architecture arch of mai_CLA_4_Bit_Logic is
begin
  Cout(0) <= G(0) or (P(0) and Cin);
  Cout(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
  Cout(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
  
  CGout <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0));
  CPout  <= (P(3) and P(2) and P(1) and P(0));
end arch;