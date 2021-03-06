library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageComparators.all;

entity test_equal is
end test_equal;

architecture arch_test of test_equal is

  -- intermediate signal declarations
  signal p1, p0, pout, poutc  : std_logic;
  signal error                : std_logic := '0';
begin
  utt: mai_equal1 port map (I0 => p0, I1 => p1, EQ => pout, EQNOT => poutc);
  process
  begin
    p0 <= '1';
    p1 <= '0';
    wait for 1 ns;
    if (pout = '1') then
      error <= '1';
    end if;
    
    wait for 200 ns;
    p0 <= '1';
    p1 <= '1';
    wait for 1 ns;
    if (pout = '0') then
      error <= '1';
    end if;  
    
    wait for 200 ns;
    p0 <= '0';
    p1 <= '1';
    wait for 1 ns;
    if (pout = '1') then
      error <= '1';
    end if;      
    
    wait for 200 ns;
    p0 <= '0';
    p1 <= '0';
    wait for 1 ns;
    if (pout = '0') then
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