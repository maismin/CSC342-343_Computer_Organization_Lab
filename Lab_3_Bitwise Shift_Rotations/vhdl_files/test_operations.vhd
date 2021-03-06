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
-- Loop through all combinations of START (only 2: 0 and 1)
        for I in 0 to 1 loop
          t_start <= std_logic_vector(to_unsigned(I, 1));
--          wait for 10 ns;
          
          -- Loop through all the OP Codes
          for J in 0 to 7 loop
            t_op <= std_logic_vector(to_unsigned(J, 3));        -- assign value to t_op
--            wait for 10 ns;
--            report "OP CODE: " & INTEGER'IMAGE(to_integer(unsigned(t_op)));
            -- only OP Codes 0 to 2 (AND, OR, XOR) requires two operands, OP codes 3 to 7 requires only 1 operand
            -- Loop through all the possible values of 6 bit binary number A (the left operand)
            for K in 0 to 63 loop
              -- if OP code is between 3 and 7, then we don't need to use operand B
            
              t_a <= std_logic_vector(to_unsigned(K, 6));       -- assign value to t_a
              
              if ((J >= 3 and J <= 7) and I = 1) then
                t_start <= std_logic_vector(to_unsigned(I, 1));
                wait for 10 ns;
                case (J) is
                when 3 =>
                  if (t_result /= (not t_a)) then 
                    report "Operation: NOT, A: " & to_string(t_a) & 
                           ", Output: " & to_string(t_result) &
                           ", Output should be: " & to_string(not t_a) severity failure;
                  end if;
                when 4 =>
                  if (t_result /= to_stdlogicvector(to_bitvector(t_a) sll 1)) then
                    report "Operation: SLL, A: " & to_string(t_a) & 
                           ", Output: " & to_string(t_result) &
                           ", Output should be: " & to_string(to_bitvector(t_a) sll 1) severity failure;
                  end if;
                when 5 =>
                  if (t_result /= to_stdlogicvector(to_bitvector(t_a) srl 1)) then
                    report "Operation: SRL, A: " & to_string(t_a) & 
                           ", Output: " & to_string(t_result) &
                           ", Output should be: " & to_string(to_bitvector(t_a) srl 1) severity failure;
                  end if;
                when 6 =>
                  if (t_result /= to_stdlogicvector(to_bitvector(t_a) rol 1)) then
                    report "Operation: ROL, A: " & to_string(t_a) & 
                           ", Output: " & to_string(t_result) &
                           ", Output should be: " & to_string(to_bitvector(t_a) rol 1) severity failure;
                  end if;
                when 7 =>
                  if (t_result /= to_stdlogicvector(to_bitvector(t_a) ror 1)) then
                    report "Operation: ROR, A: " & to_string(t_a) & 
                           ", Output: " & to_string(t_result) &
                           ", Output should be: " & to_string(to_bitvector(t_a) ror 1) severity failure;
                  end if;
                when others =>
                  NULL;
                end case;
                t_start <= "0";
                wait for 10 ns;
              else 
                --  Otherwise OP Code is between 0 and 2, and we need operand B, so we loop through all the possible values of B
                for L in 0 to 63 loop
                  
                  t_b <= std_logic_vector(to_unsigned(L, 6));       -- assign value to t_b
                  
                  if ((J >= 0 and J <= 2) and I = 1) then
                    t_start <= std_logic_vector(to_unsigned(I, 1));
                    wait for 10 ns;
                    case (J) is
                    when 0 =>
                      if (t_result /= (t_a and t_b)) then 
                        report "Operation: AND, A: " & to_string(t_a) &
                               ", B: " & to_string(t_b) &
                               ", Output: " & to_string(t_result) &
                               ", Output should be: " & to_string(t_a and t_b) severity failure;  
                      end if;
                    when 1 =>
                      if (t_result /= (t_a or t_b)) then 
                        report "Operation: OR, A: " & to_string(t_a) &
                               ", B: " & to_string(t_b) &
                               ", Output: " & to_string(t_result) &
                               ", Output should be: " & to_string(t_a or t_b) severity failure;
                      end if;
                    when 2 =>
                      if (t_result /= (t_a xor t_b)) then 
                        report "Operation: XOR, A: " & to_string(t_a) &
                               ", B: " & to_string(t_b) &
                               ", Output: " & to_string(t_result) &
                               ", Output should be: " & to_string(t_a xor t_b) severity failure;
                      end if;
                    when others =>
                      NULL;
                    end case;
                    t_start <= "0";
                    wait for 10 ns;
                  else
                    wait for 10 ns;
                    if (t_result /= "UUUUUU") then
                      report "START is " & to_string(t_start) & "OUTPUT should be UUUUUU";
                    end if;
                  end if;
                end loop;
              end if;
            end loop;
          end loop;
      end loop;

      
      wait for 100 ns;
      report "No errors detected. Simulation successful" severity failure;
  end process;
end arch;
