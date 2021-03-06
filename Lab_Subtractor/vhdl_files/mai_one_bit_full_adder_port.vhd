-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity mai_one_bit_full_adder_port is
  port (  X, Y, Cin : in std_logic;
          Sum, Cout : out std_logic);
end mai_one_bit_full_adder_port;

-- architecture
architecture arch of mai_one_bit_full_adder_port is
  -- component
  
  -- 1 bit half adder ------------------
  component mai_one_bit_half_adder
  port (  X, Y      : in std_logic;
          Sum, Cout : out std_logic);
  end component;
  
  -- intermediate signal declaration
  signal ha1s, ha1c, ha2c, t_sum : std_logic;
begin
  H1: mai_one_bit_half_adder port map ( X => X,
                                        Y => Y,
                                        Sum => ha1s,
                                        Cout => ha1c);
  H2: mai_one_bit_half_adder port map ( X => Cin,
                                        Y => ha1s,
                                        Sum => t_sum,
                                        Cout => ha2c);
  Sum <= t_sum;
  Cout <= ha1c or ha2c;
end arch;