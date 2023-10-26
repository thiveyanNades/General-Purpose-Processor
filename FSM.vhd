library ieee;
use ieee.std_logic_1164.all;
entity FSM is
port(
clk: in std_logic;
data_in : in std_logic;
reset: in std_logic;
student_id : out std_logic_vector(3 downto 0);
current_state: out std_logic_vector(3 downto 0));
end entity;

architecture Behavior of FSM is
type state_type is(s0, s1, s2, s3, s4, s5, s6, s7, s8);
signal y: state_type;
begin
process(clk, reset)
begin
if reset = '1' then
y <= s0;
elsif(clk'EVENT AND clk = '1') then
case y is
when s0=>
case data_in is
when '0' => y <= s0;
when '1' => y <= s1;
when others =>y<= s0;
end case;
when s1=>
case data_in is
when '0' => y <= s1;
when '1' => y <= s2;
when others =>y<= s1;
end case;
when s2=>
case data_in is
when '0' => y <= s2;
when '1' => y <= s3;
when others =>y<= s2;
end case;
when s3=>
case data_in is
when '0' => y <= s3;
when '1' => y <= s4;
when others =>y<= s3;
end case;
when s4=>
case data_in is
when '0' => y <= s4;
when '1' => y <= s5;
when others =>y<= s4;
end case;
when s5=>
case data_in is
when '0' => y <= s5;
when '1' => y <= s6;
when others =>y<= s5;
end case;
when s6=>
case data_in is
when '0' => y <= s6;
when '1' => y <= s7;
when others =>y<= s6;
end case;
when s7=>
case data_in is
when '0' => y <= s7;
when '1' => y <= s8;
when others =>y<= s7;
end case;
when s8=>
case data_in is
when '0' => y <= s8;
when '1' => y <= s0;
when others =>y<= s8;
end case;
end case;
end if;
end process;

process (y, data_in)
begin
case y
is
when s0=>
student_id <= "0101";
current_state <= "0000";
when s1=>
student_id <= "0000";
current_state <= "0001";
when s2=>
student_id <= "0001";
current_state <= "0010";
when s3=>
student_id <= "0000";
current_state <= "0011";
when s4=>
student_id <= "1000";
current_state <= "0100";
when s5=>
student_id <= "1001";
current_state <= "0101";
when s6=>
student_id <= "0011";
current_state <= "0110";
when s7=>
student_id <= "0011";
current_state <= "0111";
when s8=>
student_id <= "0011";
current_state <= "1000";
end case;

end process;
end Behavior;
