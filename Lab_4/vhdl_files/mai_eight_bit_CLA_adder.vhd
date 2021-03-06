-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.mai_one_bit_full_adder_g_p;
use work.MAI_PackageCLA.mai_CLA_4_Bit_Logic;

-- entity
entity mai_eight_bit_CLA_adder is
  port (  X, Y : in std_logic_vector(7 downto 0);
          Cin  : in std_logic;
          Sum  : out std_logic_vector(7 downto 0);
          CGout, CPout, Overflow : out std_logic);
end mai_eight_bit_CLA_adder;

-- architecture
architecture arch of mai_eight_bit_CLA_adder is
  -- intermediate signal declarations
  signal cg, cp, carry  : std_logic_vector(7 downto 0);
  signal cout  : std_logic;
  signal t_p, t_g : std_logic_vector(1 downto 0);
begin
  carry(0) <= Cin;
  carry(4) <= t_g(0) or (t_p(0) and Cin);
  
  CLA1: mai_CLA_4_Bit_Logic port map( G => cg(3 downto 0), 
                                      P => cp(3 downto 0), 
                                      Cin => Cin, 
                                      Cout => carry(3 downto 1), 
                                      CGout => t_g(0), 
                                      CPout => t_p(0));  
  CLA2: mai_CLA_4_Bit_Logic port map( G => cg(7 downto 4), 
                                      P => cp(7 downto 4), 
                                      Cin => carry(4), 
                                      Cout => carry(7 downto 5), 
                                      CGout => t_g(1), 
                                      CPout => t_p(1));
  
  FAO : mai_one_bit_full_adder_g_p port map(X => X(0), Y => Y(0), Cin => carry(0), Sum => Sum(0), G => cg(0), P => cp(0));
  FA1 : mai_one_bit_full_adder_g_p port map(X => X(1), Y => Y(1), Cin => carry(1), Sum => Sum(1), G => cg(1), P => cp(1));
  FA2 : mai_one_bit_full_adder_g_p port map(X => X(2), Y => Y(2), Cin => carry(2), Sum => Sum(2), G => cg(2), P => cp(2));
  FA3 : mai_one_bit_full_adder_g_p port map(X => X(3), Y => Y(3), Cin => carry(3), Sum => Sum(3), G => cg(3), P => cp(3));
  FA4 : mai_one_bit_full_adder_g_p port map(X => X(4), Y => Y(4), Cin => carry(4), Sum => Sum(4), G => cg(4), P => cp(4));
  FA5 : mai_one_bit_full_adder_g_p port map(X => X(5), Y => Y(5), Cin => carry(5), Sum => Sum(5), G => cg(5), P => cp(5));
  FA6 : mai_one_bit_full_adder_g_p port map(X => X(6), Y => Y(6), Cin => carry(6), Sum => Sum(6), G => cg(6), P => cp(6));
  FA7 : mai_one_bit_full_adder_g_p port map(X => X(7), Y => Y(7), Cin => carry(7), Sum => Sum(7), G => cg(7), P => cp(7));
  
  CGout <= t_g(1);
  CPout <= t_p(1);
  Overflow <= carry(3) xor (t_g(1) or (t_p(1) and carry(0)));
end arch;


