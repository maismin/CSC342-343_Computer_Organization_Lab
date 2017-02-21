-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.MAI_PackageSubtractors.all;

-- entity
entity test_four_bit_subtractor is
end test_four_bit_subtractor;

-- architecture
architecture arch_test of test_four_bit_subtractor is

  -- intermediate signal declaration
  signal t_x, t_y, t_s         : std_logic_vector(3 downto 0);
  signal t_cout, t_v, t_n, t_z : std_logic;
  signal v_v, v_n, v_z : std_logic := '0';
  signal error                 : std_logic := '0';
begin
  uut: mai_four_bit_subtractor port map(X => t_x, Y => t_y, SUM => t_s, Cout => t_cout, V => t_v, N => t_n, Z => t_z);
  process
    -- variable declaration
    variable int_x, int_y : integer range -8 to 7;
    variable int_sum      : integer range -16 to 14;      -- holds the value calculated from the entity
    variable int_calc_sum : integer range -16 to 14;      -- holds the calculated value of int_x - int_y
    variable errSum, errV, errN, errZ: boolean := false;  -- variables used to check for errors
    
    begin
      t_x <= "0000";
      t_y <= "0000";
      
      for I in 0 to 255 loop
        for J in 0 to 255 loop
          wait for 200 ns;
          
          int_x := to_integer(signed(t_x));
          int_y := to_integer(signed(t_y));
          int_sum := to_integer(signed(t_s));
          int_calc_sum := to_integer((signed(t_x)) - (signed(t_y)));
          
          -- checks for potential errors
          -- is the Zero bit incorrect?
          if ((int_x = int_y) and t_z /= '1') then
            errZ := true;
            v_z <= '1';
          else
            errZ := false;
            v_z <= '0';
          end if;
          
          -- is the Sum incorrect?
          if (int_sum /= int_calc_sum) then
            errSum := true;
          else
            errSum := false;
          end if;
          
          -- is the Overflow bit incorrect?
          if (((int_x >= 0 and int_y < 0 and int_calc_sum < 0) or (int_x < 0 and int_y >= 0 and int_calc_sum >= 0)) and t_v /= '1') then
            errV := true;
            v_v <= '1';
          else
            errV := false;
            v_v <= '0';
          end if;
          
          -- is the Negative bit incorrect?
          if (int_sum < 0 and t_n /= '1') then
            errN := true;
            v_z <= '1';
          else
            errN := false;
            v_z <= '0';
          end if;

-- Error Display ---------------------------------------------------------------------------------
          if (errZ or errSum or errV or errN) then
            error <= '1';
            report "Error: (" & INTEGER'IMAGE(int_x) & 
                 ") - (" & INTEGER'IMAGE(int_y) & ")" &LF& 
                 "Output of 4Bit Subtractor:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_sum) &
                 " V = " & STD_LOGIC'IMAGE(t_v) &
                 " N = " & STD_LOGIC'IMAGE(t_n) &
                 " Z = " & STD_LOGIC'IMAGE(t_z) &LF&
                 "The real output should be:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_calc_sum) &
                 " V = " & STD_LOGIC'IMAGE(v_v) &
                 " N = " & STD_LOGIC'IMAGE(v_n) &
                 " Z = " & STD_LOGIC'IMAGE(v_z);
          end if;
-- ------------------------------------------------------------------------------------------------ 
               
          t_x <= std_logic_vector(unsigned(t_x) + 1);
        end loop;
        t_y <= std_logic_vector(unsigned(t_y) + 1);
      end loop;

      wait for 200 ns;
      if (error = '0') then
        report "No errors detected. Simulation successful" severity failure;
      else
        report "Error detected" severity failure;
      end if;
      
  end process;
end arch_test;