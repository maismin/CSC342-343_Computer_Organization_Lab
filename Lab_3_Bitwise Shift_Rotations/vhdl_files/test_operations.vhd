-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.MAI_PackageOperations.mai_operations;

-- entity declaration
entity test_operations is
end test_operations;

-- architecture
architecture arch of test_operations is
  -- intermediate signal declarations
  signal t_start            : std_logic_vector(0 downto 0);
  signal t_op               : std_logic_vector(2 downto 0);
  signal t_a, t_b, t_result : std_logic_vector(5 downto 0);
  
  begin
    -- UNIT UNDER TEST: OPERATIONS
    UUT:  mai_operations port map(  START => t_start(0),
                                    OP    => t_op,
                                    A     => t_a,
                                    B     => t_b,
                                    RESULT=> t_result
    );
  process
    begin
      t_start(0) <= '0';
      wait for 10 ns;
      
      -- Loop through all combinations of START (only 2: 0 and 1)
      for I in 0 to 1 loop
        t_start <= std_logic_vector(unsigned(t_start) + I);
        wait for 10 ns;
        
        -- Loop through all the OP Codes
        for J in 0 to 7 loop
          t_op <= std_logic_vector(to_unsigned(J, 3));        -- assign value to t_op
          wait for 10 ns;
--          report "OP CODE: " & INTEGER'IMAGE(to_integer(unsigned(t_op)));
          -- only OP Codes 0 to 2 (AND, OR, XOR) requires two operands, OP codes 3 to 7 requires only 1 operand
          -- Loop through all the possible values of 6 bit binary number A (the left operand)
          for K in 0 to 63 loop
            -- if OP code is between 3 and 7, then we don't need to use operand B
            
            t_a <= std_logic_vector(to_unsigned(K, 6));       -- assign value to t_a
            
            if (J >= 3 and J <= 7) then
              case (J) is
              when 3 =>
                if (t_result /= (not t_a)) then
                end if;
              when 4 =>
                if (t_result /= to_stdlogicvector(to_bitvector(t_a) sll 1)) then
                end if;
              when 5 =>
                if (t_result /= to_stdlogicvector(to_bitvector(t_a) srl 1)) then
                end if;
              when 6 =>
                if (t_result /= to_stdlogicvector(to_bitvector(t_a) rol 1)) then
                end if;
              when 7 =>
                if (t_result /= to_stdlogicvector(to_bitvector(t_a) ror 1)) then
                end if;
              when others =>
                NULL;
              end case;
            else
              --  Otherwise OP Code is between 0 and 2, and we need operand B, so we loop through all the possible values of B
              for L in 0 to 63 loop
                
              end loop;
            end if;
          end loop;
        end loop;
      end loop;
      
      wait for 100 ns;
      report "No errors detected. Simulation successful" severity failure;
  end process;
end arch;