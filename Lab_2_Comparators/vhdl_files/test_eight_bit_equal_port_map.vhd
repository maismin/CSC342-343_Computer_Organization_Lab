-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- entity
entity test_eight_bit_equal_port_map is
end test_eight_bit_equal_port_map;

-- architecture
architecture arch_test of test_eight_bit_equal_port_map is
  -- component
  component mai_eight_bit_equal_port is
    port (  A, B      : in std_logic_vector(7 downto 0);
            EQ, EQNOT : out std_logic);
  end component;

  -- intermediate signal declaration
  signal p1, p0 : std_logic_vector(7 downto 0);
  signal pout   : std_logic;
  signal poutc  : std_logic;
  signal error  : std_logic := '0';
begin
  uut: mai_eight_bit_equal_port port map(A => p0, B => p1, EQ => pout, EQNOT => poutc);
  process
    begin
      p0 <= "00000000";
      p1 <= "00000000";
      
      for I in 0 to 255 loop
        for J in 0 to 255 loop
          wait for 200 ns;
          if ((p0 = p1) and (pout /= '1')) then
            error <= '1';
          end if;   
          p1 <= p1 + "00000001";
        end loop;
        p0 <= p0 + "00000001";
      end loop;

      wait for 200 ns;
      if (error = '0') then
        report "No errors detected. Simulation successful" severity failure;
      else
        report "Error detected" severity failure;
      end if;
      
  end process;
end arch_test;