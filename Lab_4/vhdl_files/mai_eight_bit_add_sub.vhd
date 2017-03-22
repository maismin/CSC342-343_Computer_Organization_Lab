-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageSubtractors.all;
use work.MAI_PackageMux.all;

-- entity declaration
entity mai_eight_bit_add_sub is
  port ( X, Y : in std_logic_vector(7 downto 0);
         SEL  : in std_logic;   -- 1 for subtract, 0 for add
         SUM  : out std_logic_vector(7 downto 0);
         Cout : out std_logic;
         V    : out std_logic;
         N    : out std_logic;
         Z    : out std_logic);
end mai_eight_bit_add_sub;

architecture arch of mai_eight_bit_add_sub is
  -- intermediate signal declarations
  signal t_y, t_yn, t_c, t_s      : std_logic_vector(7 downto 0);
  signal t_cin, t_cout, t_v, t_n  : std_logic;
  signal t_z                      : std_logic_vector(1 downto 0);
begin
  t_yn <= not Y;
  MUX: mai_2to1_8bit_mux port map(SEL => SEL, A => Y, B => t_yn, MUX_OUT => t_y);
  Low4: mai_four_bit_subtractor port map(X => X(3 downto 0), 
                                         Y => t_y(3 downto 0),
                                         Cin => SEL,
                                         SUM => t_s(3 downto 0), 
                                         Cout => t_cin, 
                                         V => open, 
                                         N => open, 
                                         Z => t_z(0));
                                         
  High4: mai_four_bit_subtractor port map(X => X(7 downto 4), 
                                         Y => t_y(7 downto 4),
                                         Cin => t_cin,
                                         SUM => t_s(7 downto 4), 
                                         Cout => t_cout, 
                                         V => t_v, 
                                         N => t_n, 
                                         Z => t_z(1));
  Cout <= t_cout;
  SUM <= t_s;
  V <= t_v;
  N <= t_n;
  Z <= t_z(0) and t_z(1);
end arch;
