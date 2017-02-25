-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- package declaration
package MAI_PackageOperations is
  component mai_operations
  port (  START : in std_logic;                       -- if START = '1', then do A OP B; otherwise do nothing
          OP    : in std_logic_vector(2 downto 0);    -- OPERATION: SEE BELOW
          A, B  : in std_logic_vector(5 downto 0);    -- A is the first operand, B is the second operand
          RESULT: out std_logic_vector(5 downto 0)
  );
end component;
end package MAI_PackageOperations;
