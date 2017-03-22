-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.MAI_PackageSubtractors.all;

-- entity
entity test_eight_bit_add_sub is
end test_eight_bit_add_sub;

-- architecture
architecture arch_test of test_eight_bit_add_sub is

  -- intermediate signal declaration
  signal t_x, t_y, t_s                : std_logic_vector(7 downto 0);  -- external signals
  signal t_cout, t_v, t_n, t_z, t_cin : std_logic;                     -- external signals
begin
  uut: mai_eight_bit_add_sub port map(X => t_x, Y => t_y, SUM => t_s, SEL => t_cin, Cout => t_cout, V => t_v, N => t_n, Z => t_z);
  process
    -- variable declaration
    variable int_x, int_y   : integer range -128 to 127;
    variable int_sum        : integer range -128 to 127;      -- holds the value calculated from the entity
    variable int_calc_sum   : integer range -128 to 127;      -- holds the calculated value of int_x - int_y
    variable v_v, v_n, v_z  : integer range 0 to 1;
    
    begin
-- ==================================================================================================   
--                                Test bench for 8 bit signed subtraction 
-- ================================================================================================== 
      t_x <= "00000000";
      t_y <= "00000000";
      t_cin <= '1';       -- this bit indicates that the operation is subtraction
      
      for I in 0 to 255 loop
        for J in 0 to 255 loop
          wait for 200 ns;
          int_x := to_integer(signed(t_x));
          int_y := to_integer(signed(t_y));
          int_sum := to_integer(signed(t_s));                     -- output of 8 bit subtractor unit
          int_calc_sum := to_integer(signed(t_x) - signed(t_y));  -- output of expected value
          
-- Error Display ---------------------------------------------------------------------------------
          if (int_sum /= int_calc_sum) then
            -- calculate what the actual output should be and compare with output from 8 bit subtractor component
            -- check if Zero bit is correct         
            if (int_calc_sum = 0) then
             v_z := 1;
            else
              v_z := 0;
            end if;
                    
            -- is the Overflow bit incorrect?
            if ((int_x >= 0 and int_y < 0 and int_calc_sum < 0) or (int_x < 0 and int_y >= 0 and int_calc_sum >= 0)) then
              v_v := 1;
            else
              v_v := 0;
            end if;
          
            -- is the Negative bit incorrect?
            if (int_calc_sum < 0) then
              v_n := 1;
            else
              v_n := 0;
            end if;
            assert (false)
            report "Error: (" & INTEGER'IMAGE(int_x) & 
                 ") - (" & INTEGER'IMAGE(int_y) & ")" &LF& 
                 "Output of 8 Bit Subtractor:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_sum) &
                 ", V = " & STD_LOGIC'IMAGE(t_v) &
                 ", N = " & STD_LOGIC'IMAGE(t_n) &
                 ", Z = " & STD_LOGIC'IMAGE(t_z) &LF&
                 "The real output should be:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_calc_sum) &
                 ", V = " & INTEGER'IMAGE(v_v) &
                 ", N = " & INTEGER'IMAGE(v_n) &
                 ", Z = " & INTEGER'IMAGE(v_z)
            severity failure;
          end if;
-- ------------------------------------------------------------------------------------------------              
          t_x <= std_logic_vector(unsigned(t_x) + 1);
        end loop;
        t_y <= std_logic_vector(unsigned(t_y) + 1);
      end loop;
-- ==================================================================================================   
      
-- ==================================================================================================   
--                                Test bench for 8 bit signed addition 
-- ==================================================================================================    
      t_x <= "00000000";
      t_y <= "00000000";
      t_cin <= '0';                   -- this bit indicates that the operation is addition    
      
      for I in 0 to 255 loop
        for J in 0 to 255 loop
          wait for 200 ns;
          int_x := to_integer(signed(t_x));
          int_y := to_integer(signed(t_y));
          int_sum := to_integer(signed(t_s));                     -- output of 8 bit adder unit
          int_calc_sum := to_integer(signed(t_x) + signed(t_y));  -- output of expected value
          
-- Error Display ---------------------------------------------------------------------------------
          if (int_sum /= int_calc_sum) then
            -- calculate what the actual output should be and compare with output from 8 bit adder component
            -- check if Zero bit is correct         
            if (int_calc_sum = 0) then
             v_z := 1;
            else
              v_z := 0;
            end if;
                    
            -- is the Overflow bit incorrect?
            if ((int_x >= 0 and int_y < 0 and int_calc_sum < 0) or (int_x < 0 and int_y >= 0 and int_calc_sum >= 0)) then
              v_v := 1;
            else
              v_v := 0;
            end if;
          
            -- is the Negative bit incorrect?
            if (int_calc_sum < 0) then
              v_n := 1;
            else
              v_n := 0;
            end if;
            assert (false)
            report "Error: (" & INTEGER'IMAGE(int_x) & 
                 ") + (" & INTEGER'IMAGE(int_y) & ")" &LF& 
                 "Output of 8 Bit Adder:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_sum) &
                 ", V = " & STD_LOGIC'IMAGE(t_v) &
                 ", N = " & STD_LOGIC'IMAGE(t_n) &
                 ", Z = " & STD_LOGIC'IMAGE(t_z) &LF&
                 "The real output should be:" &LF&
                 "SUM = " & INTEGER'IMAGE(int_calc_sum) &
                 ", V = " & INTEGER'IMAGE(v_v) &
                 ", N = " & INTEGER'IMAGE(v_n) &
                 ", Z = " & INTEGER'IMAGE(v_z)
            severity failure;
          end if;
-- ------------------------------------------------------------------------------------------------              
          t_x <= std_logic_vector(unsigned(t_x) + 1);
        end loop;
        t_y <= std_logic_vector(unsigned(t_y) + 1);
      end loop;
-- ================================================================================================== 
      wait for 100 ns;
      report "No errors detected. Simulation successful" severity failure;
      
  end process;
end arch_test;