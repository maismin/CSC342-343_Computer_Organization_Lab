-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageComparators.all;

-- entity
entity test_two_bit_equal_port is
end test_two_bit_equal_port;

-- architecture
architecture arch_test of test_two_bit_equal_port is
  
  -- intermediate signal declaration
  signal p1, p0 : std_logic_vector(1 downto 0);
  signal pout, poutc   : std_logic;
  signal error  : std_logic := '0';
  
  begin
    utt:  mai_two_bit_equal_port port map (a => p0, b => p1, EQ => pout, EQNOT => poutc);
    process
      begin
        
        p0 <= "00";
        p1 <= "00";
        wait for 1 ns;
        if (pout = '0') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "01";
        p1 <= "00";
        wait for 1 ns;
        if (pout = '1') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "01";
        p1 <= "11";
        wait for 1 ns;
        if (pout = '1') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "11";
        p1 <= "00";
        wait for 1 ns;
        if (pout = '1') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "11";
        p1 <= "11";
        wait for 1 ns;
        if (pout = '0') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "10";
        p1 <= "11";
        wait for 1 ns;
        if (pout = '1') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "10";
        p1 <= "10";
        wait for 1 ns;
        if (pout = '0') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        p0 <= "11";
        p1 <= "01";
        wait for 1 ns;
        if (pout = '1') then
          error <= '1';
        end if;
        
        wait for 200 ns;
        
        if (error = '0') then
          report "No errors detected. Simulation successful" severity failure;
        else
          report "Error detected" severity failure;
        end if;
        
    end process;
end arch_test;