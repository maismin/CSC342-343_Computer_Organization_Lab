-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
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
    -- variable declaration
    variable int_x, int_y   : integer range 0 to 15;
    variable int_sum        : integer range 0 to 15;      -- holds the value calculated from the entity
    variable int_calc_sum   : integer range 0 to 15;      -- holds the calculated value of int_x - int_y
  begin
    t_x <= "0000";
    t_y <= "0000";
    t_Cin <= '0';
    
    -- Loop over all values of X
    for I in 0 to 15 loop
      -- Loop over all values of Y
      for J in 0 to 15 loop
        wait for 100 ns;
        int_x := to_integer(unsigned(t_x));
        int_y := to_integer(unsigned(t_y));
        int_sum := to_integer(unsigned(t_sum));                     -- output of 4 bit adder unit
        int_calc_sum := to_integer(unsigned(t_x) + unsigned(t_y));  -- output of expected value
        
        -- Check value of Sum
        assert (int_sum = int_calc_sum)
          report "ERROR: " & INTEGER'IMAGE(int_x) & 
                 " + " & INTEGER'IMAGE(int_y) & 
                 " = " & INTEGER'IMAGE(int_sum) & 
                 ", SUM should be " & INTEGER'IMAGE(int_calc_sum)
          severity failure;

        t_y <= std_logic_vector(unsigned(t_y) + 1);
      end loop;
      t_x <= std_logic_vector(unsigned(t_x) + 1);
    end loop;
    
    wait for 100 ns;
      
    report "No errors detected. Simulation successful" severity failure;
  end process;
end arch_test;
