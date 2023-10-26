library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU2 is
port(Clock: in std_logic;--input clock signal
A,B:in unsigned(7 downto 0); --8 bit inputs from latches A and B
student_id: in unsigned(3 downto 0); --4 bit student id from FSM
OP: in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
Neg: out std_logic; --is the result negative? set-ve bit output
R1: out unsigned(3 downto 0); --lower 4-bits of 8-bit Result Output
R2: out unsigned (3 downto 0)); --higher 4-bits of 8-bit Result Output
end ALU2;
architecture calculation of ALU2 is --temporary signal declaration
signal Reg1,Reg2,Result:unsigned(7 downto 0):=(others=>'0');
signal Reg4: unsigned(0 to 7);
begin
Reg1 <= A; --temporarily store A in Reg1 local variable
Reg2 <= B; --temporarily store B in Reg2 local variable
process(Clock,OP)
begin
if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
case OP is
When "0000000000000001" => --1
Result <= 2+Reg1; --increment by 2
When "0000000000000010" => --2
--input bit = 0
Result <= shift_right(unsigned(Reg2),2); --shift to the right by 2
When "0000000000000100" => --3
Result <= shift_left(unsigned(Reg1),4); --shift to the right by 4
Result(7) <= '1'; --input bit = 1
Result(6) <= '1';
Result(5) <= '1';
Result(4) <= '1';
When "0000000000001000" => --4
if(Reg2>Reg1) TheN
Result <= Reg1;
else
Result <= Reg2;
end if;
Neg<='0';
When "0000000000010000" => --5
Result <= Reg4; --ROR A by 2
Result(7) <= Reg1(1);
Result(6) <= Reg1(0);
Result(5) <= Reg1(7);
Result(4) <= Reg1(6);
Result(3) <= Reg1(5);
Result(2) <= Reg1(4);
Result(1) <= Reg1(3);
Result(0) <= Reg1(2);
Neg<='0';
When "0000000000100000" => --6
Result <= Reg4; --invert bit significance
Result(7) <= Reg2(0);
Result(6) <= Reg2(1);
Result(5) <= Reg2(2);
Result(4) <= Reg2(3);
Result(3) <= Reg2(4);
Result(2) <= Reg2(5);
Result(1) <= Reg2(6);
Result(0) <= Reg2(7);
Neg<='0';
When "0000000001000000" => --7
Result <= (Reg1 XOR Reg2); --boolean XOR
Neg<='0';
When "0000000010000000" => --8
Result <= ((Reg1 + Reg2)-4); --summation of A and B minus 4
When "0000000100000000" => --9
Result (7)<= Reg1(7); --all values are set to high bit
Result (6)<= Reg1(7);
Result (5)<= Reg1(7);
Result (4)<= Reg1(7);
Result (3)<= Reg1(7);
Result (2)<= Reg1(7);
Result (1)<= Reg1(7);
Result (0)<= Reg1(7);
Neg<='0';
When OTHERS =>
--don't care, do nothing
Result <= "--------";
end case;
end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); --only 4-bits, split the 8-bit to two 4-bits.
end calculation;
