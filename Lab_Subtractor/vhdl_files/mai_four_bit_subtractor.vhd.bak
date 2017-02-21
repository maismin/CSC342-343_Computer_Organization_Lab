-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.all;

-- entity
entity mai_four_bit_subtractor is
  port (  X, Y : in std_logic_vector(3 downto 0);
          Sum  : out std_logic_vector(3 downto 0);
          Cout : out std_logic;
          V    : out std_logic;
          N    : out std_logic;
          Z    : out std_logic);
end mai_four_bit_subtractor;

-- architecture
architecture arch of mai_four_bit_subtractor is
  
  -- intermediate signal declaration
  signal t_y, c,s : std_logic_vector(3 downto 0);
begin
  t_y <= not Y;
  
  FA0 : mai_one_bit_full_adder_port port map(X => X(0), Y => t_y(0), Cin => '1', Sum => s(0), Cout => c(0));
  FA1 : mai_one_bit_full_adder_port port map(X => X(1), Y => t_y(1), Cin => c(0), Sum => s(1), Cout => c(1));
  FA2 : mai_one_bit_full_adder_port port map(X => X(2), Y => t_y(2), Cin => c(1), Sum => s(2), Cout => c(2));
  FA3 : mai_one_bit_full_adder_port port map(X => X(3), Y => t_y(3), Cin => c(2), Sum => s(3), Cout => c(3));
  
  Sum <= s;
  Cout <= c(3);
  V <= c(3) xor c(2);
  N <= s(3);
  Z <= not (s(0) or s(1) or s(2) or s(3));
end arch;