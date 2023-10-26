Library ieee;
USE ieee.std_logic_1164.all ;
ENTITY ssegmodified IS
PORT (
bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
neg : IN STD_LOGIC;
leds : OUT STD_LOGIC_VECTOR(0 TO 6);
ledss : OUT STD_LOGIC_VECTOR(0 TO 6));

END ssegmodified;

ARCHITECTURE Behavior OF ssegmodified IS
BEGIN
PROCESS (bcd, neg)
BEGIN

if(neg ='1') then
ledss <="0000001";
end if;
if (neg = '0') then
ledss <="0000000";
end if;

CASE bcd IS -- abcdefg
WHEN "0000" => leds <= "0111011" ; -- y
WHEN "1111" => leds <= "0010101" ; -- n
When others => leds <= "-------";



END CASE ;
END PROCESS ;
END Behavior ;
