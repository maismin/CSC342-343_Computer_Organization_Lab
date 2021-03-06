-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.all;

-- entity
entity mai_four_bit_full_adder is
  port (  X, Y : in std_logic_vector(3 downto 0);
          Cin  : in std_logic;
          Sum  : out std_logic_vector(3 downto 0);
          Cout : out std_logic);
end mai_four_bit_full_adder;

-- architecture
architecture arch of mai_four_bit_full_adder is
  
  -- intermediate signal declaration
  signal c : std_logic_vector(3 downto 0);
begin
  FA0 : mai_one_bit_full_adder_port port map(X => X(0), Y => Y(0), Cin => Cin, Sum => Sum(0), Cout => c(0));
  FA1 : mai_one_bit_full_adder_port port map(X => X(1), Y => Y(1), Cin => c(0), Sum => Sum(1), Cout => c(1));
  FA2 : mai_one_bit_full_adder_port port map(X => X(2), Y => Y(2), Cin => c(1), Sum => Sum(2), Cout => c(2));
  FA3 : mai_one_bit_full_adder_port port map(X => X(3), Y => Y(3), Cin => c(2), Sum => Sum(3), Cout => c(3));
  Cout <= c(3);
end arch;