-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.mai_one_bit_full_adder_g_p;
use work.MAI_PackageCLA.mai_CLA_4_Bit_Logic;

-- entity
entity mai_four_bit_CLA_adder is
  port (  X, Y : in std_logic_vector(3 downto 0);
          Cin  : in std_logic;
          Sum  : out std_logic_vector(3 downto 0);
          CGout, CPout, Overflow : out std_logic);
end mai_four_bit_CLA_adder;

-- architecture
architecture arch of mai_four_bit_CLA_adder is
  -- intermediate signal declarations
  signal cg, cp, carry : std_logic_vector(3 downto 0);
  signal cout          : std_logic;
begin
  CLA : mai_CLA_4_Bit_Logic port map(G => cg, P => cp, Cin => Cin, Cout => carry(3 downto 1), CGout => cout, CPout => CPout);
  carry(0) <= Cin;
  
  FAO : mai_one_bit_full_adder_g_p port map(X => X(0), Y => Y(0), Cin => carry(0), Sum => Sum(0), G => cg(0), P => cp(0));
  FA1 : mai_one_bit_full_adder_g_p port map(X => X(1), Y => Y(1), Cin => carry(1), Sum => Sum(1), G => cg(1), P => cp(1));
  FA2 : mai_one_bit_full_adder_g_p port map(X => X(2), Y => Y(2), Cin => carry(2), Sum => Sum(2), G => cg(2), P => cp(2));
  FA3 : mai_one_bit_full_adder_g_p port map(X => X(3), Y => Y(3), Cin => carry(3), Sum => Sum(3), G => cg(3), P => cp(3));
  
  CGout <= cout;
  Overflow <= carry(3) xor cout;
end arch;