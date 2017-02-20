-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.all;

-- entity
entity test_1b_fadder_port is
end test_1b_fadder_port;

-- architecture
architecture arch_test of test_1b_fadder_port is

  -- intermediate signal declaration ------
  signal t_x, t_y, t_cin  : std_logic;
  signal t_out            : std_logic_vector(1 downto 0); -- t_out(1) contains the Cout, t_out(0) contains Sum
  signal error            : std_logic := '0';
begin
  utt: mai_one_bit_full_adder_port port map (X => t_x, Y => t_y, Cin => t_cin, Sum => t_out(0), Cout => t_out(1));
  process
  begin
    t_x <= '0';
    t_y <= '0';
    t_cin <= '0';
    wait for 1 ns;
    if (t_out /= "00") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '0';
    t_y <= '0';
    t_cin <= '1';
    wait for 1 ns;
    if (t_out /= "01") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '0';
    t_y <= '1';
    t_cin <= '0';
    wait for 1 ns;
    if (t_out /= "01") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '0';
    t_y <= '1';
    t_cin <= '1';
    wait for 1 ns;
    if (t_out /= "10") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '1';
    t_y <= '0';
    t_cin <= '0';
    wait for 1 ns;
    if (t_out /= "01") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '1';
    t_y <= '0';
    t_cin <= '1';
    wait for 1 ns;
    if (t_out /= "10") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '1';
    t_y <= '1';
    t_cin <= '0';
    wait for 1 ns;
    if (t_out /= "10") then
      error <= '1';
    end if;
    
    wait for 200 ns;
    t_x <= '1';
    t_y <= '1';
    t_cin <= '1';
    wait for 1 ns;
    if (t_out /= "11") then
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