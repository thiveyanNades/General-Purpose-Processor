library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity ALU3 is
port(clock : in std_logic;
A,B: in unsigned(7 downto 0);
student_id : in unsigned(3 downto 0);
OP: in unsigned(15 downto 0);
Neg: out std_logic;
R1 : out unsigned(3 downto 0);
R2 : out unsigned(3 downto 0));
end ALU3;
architecture calculation of ALU3 is
signal Reg1, Reg2, Result: unsigned(7 downto 0):=(others=>'0');
signal Reg4 : unsigned(0 to 7);

begin
Reg1 <= A;
Reg2 <= B;
process(clock,OP)
begin
if(rising_edge(clock)) then
Case OP is
when "0000000000000001"=>
if (student_id(0) = '0') then
Result <= ("00000000");
Neg<=('0');
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000000000010"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000000000100"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000000001000"=>--complete 4 if one is greater than the other
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000000010000"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000000100000"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000001000000"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000010000000"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when "0000000100000000"=>
if (student_id(0) = '0') then
Result <= "00000000";
Neg<='0';
else
Result <= "11111111";
Neg<='0';
end if;

when Others=> Result <= "--------";
end case;
end if;
end process;
R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;
