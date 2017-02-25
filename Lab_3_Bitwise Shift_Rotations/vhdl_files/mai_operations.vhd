-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity mai_operations is
  port (  START : in std_logic;                       -- if START = '1', then do A OP B; otherwise do nothing
          OP    : in std_logic_vector(2 downto 0);    -- OPERATION: SEE BELOW
          A, B  : in std_logic_vector(5 downto 0);    -- A is the first operand, B is the second operand
          RESULT: out std_logic_vector(5 downto 0)
  );
end mai_operations;
--=========================================================
--                  OP CODE
--                  000 - AND
--                  001 - OR
--                  010 - XOR
--                  011 - NOT
--                  100 - LEFT LOGICAL SHIFT
--                  101 - RIGHT LOGICAL SHIFT
--                  110 - LEFT ROTATION
--                  111 - RIGHT ROTATION
--=========================================================

-- architecture
architecture arch of mai_operations is
  begin
    
    process (START)
    begin
      if (START = '1') then
        case (OP) is
        when "000" =>
          RESULT <= A and B;
        when "001" =>
          RESULT <= A or B;
        when "010" =>
          RESULT <= A xor B;
        when "011" =>
          RESULT <= not A;
        when "100" =>
          RESULT <= to_stdlogicvector(to_bitvector(A) sll 1);
        when "101" =>
          RESULT <= to_stdlogicvector(to_bitvector(A) srl 1);
        when "110" =>
          RESULT <= to_stdlogicvector(to_bitvector(A) rol 1);
        when "111" =>
          RESULT <= to_stdlogicvector(to_bitvector(A) ror 1);
        when others =>
          NULL;
        end case;
      end if;
    end process;
end arch;