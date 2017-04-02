-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use work.MAI_PackageAdders.mai_eight_bit_CLA_adder;
use work.MAI_PackageMux.mai_2to1_8bit_mux;

-- entity declaration
entity mai_eight_bit_CLA_add_sub is
  port ( X, Y : in std_logic_vector(7 downto 0);
         SEL  : in std_logic;   -- 1 for subtract, 0 for add
         SUM  : out std_logic_vector(7 downto 0);
         Cout : out std_logic;
         CGout: out std_logic;
         CPout: out std_logic;
         V    : out std_logic;
         N    : out std_logic;
         Z    : out std_logic);
end mai_eight_bit_CLA_add_sub;

architecture arch of mai_eight_bit_CLA_add_sub is
  -- intermediate signal declarations
  signal t_y, t_yn, t_c, t_s      : std_logic_vector(7 downto 0);
  signal t_cgout, t_cpout         : std_logic;
  signal t_cin, t_cout, t_v, t_n  : std_logic;
  signal t_z                      : std_logic_vector(1 downto 0);
begin
  t_yn <= not Y;
  MUX: mai_2to1_8bit_mux port map(SEL => SEL, A => t_yn, B => Y, MUX_OUT => t_y);
  ADD: mai_eight_bit_CLA_adder port map(  X => X(7 downto 0),
                                          Y => t_y(7 downto 0),
                                          Cin => SEL,
                                          Sum => t_s(7 downto 0),
                                          CGout => t_cgout,
                                          CPout => t_cpout,
                                          Overflow => t_v);

  Cout <= t_cgout or (t_cpout and SEL);
  CGout <= t_cgout;
  CPout <= t_cpout;
  SUM <= t_s;
  V <= t_v;
  N <= t_s(7);
  Z <= (not t_s(7)) and (not t_s(6)) and (not t_s(5)) and (not t_s(4)) and (not t_s(3)) and (not t_s(2)) and (not t_s(1)) and (not t_s(0));
end arch;