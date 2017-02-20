-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.MAI_PackageAdders.all;

-- entity
entity test_4b_fadder is
end test_4b_fadder;

-- architecture
architecture arch_test of test_4b_fadder is
  -- intermediate signal declarations
  signal t_x, t_y, t_sum  : std_logic_vector(3 downto 0);
  signal t_cin, t_cout    : std_logic;
  signal error            : std_logic := '0';
  
begin
  t:  mai_four_bit_full_adder port map(X => t_x, Y => t_y, Cin => t_cin, Sum => t_sum, Cout => t_cout);
  process
  begin
    t_x <= "0000";
    t_y <= "0000";
    t_Cin <= '0';
    
    -- Loop over all values of X
    for I in 0 to 15 loop
      -- Loop over all values of Y
      for J in 0 to 15 loop
        wait for 200 ns;
        -- Check value of Sum
        if (t_sum /= (t_x + t_y)) then
          report "ERROR: " & INTEGER'IMAGE(to_integer(unsigned(t_x))) & 
                 " + " & INTEGER'IMAGE(to_integer(unsigned(t_y))) & 
                 " = " & INTEGER'IMAGE(to_integer(unsigned(t_sum))) & 
                 ", SUM should be " & INTEGER'IMAGE(to_integer(unsigned(t_x+t_y)));
          error <= '1';
        end if;
        t_y <= t_y + "0001";
      end loop;
      t_x <= t_x + "0001";
    end loop;
    
    wait for 200 ns;
      
    if (error = '0') then
      report "No errors detected. Simulation successful" severity failure;
    else
      report "Error detected" severity failure;
    end if;
  end process;
end arch_test;
