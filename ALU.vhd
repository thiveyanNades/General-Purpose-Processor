library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
port(Clock: in std_logic;--input clock signal
A,B:in unsigned(7 downto 0); --8 bit inputs from latches A and B
student_id: in unsigned(3 downto 0); --4 bit student id from FSM
OP: in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
Neg: out std_logic; --is the result negative? set-ve bit output
R1: out unsigned(3 downto 0); --lower 4-bits of 8-bit Result Output
R2: out unsigned (3 downto 0)); --higher 4-bits of 8-bit Result Output
end ALU;
architecture calculation of ALU is --temporary signal declaration
signal Reg1,Reg2,Result:unsigned(7 downto 0):=(others=>'0');
signal Reg4: unsigned(0 to 7);
begin
Reg1 <= A; --temporarily store A in Reg1 local variable
Reg2 <= B; --temporarily store B in Reg2 local variable
process(Clock,OP)
begin
if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
case OP is
When "0000000000000001" =>
Result <= (Reg1 + Reg2); --addition
When "0000000000000010" =>
if(Reg2>Reg1) then
Result<=(Reg1+(NOT Reg2+1));
Neg<='1'; --negative bit
else
Result<=(Reg1-Reg2);
Neg<='0';
end if;
When "0000000000000100" =>
Result <= (NOT Reg1); --inverse
When "0000000000001000" =>
Result <= (Reg1 NAND Reg2); --boolean NAND
When "0000000000010000" =>
Result <= (Reg1 NOR Reg2); --boolean NOR
When "0000000000100000" =>
Result <= (Reg1 AND Reg2); --boolean AND
When "0000000001000000" =>
Result <= (Reg1 XOR Reg2); --boolean XOR
When "0000000010000000" =>
Result <= (Reg1 OR Reg2); --boolean OR
When "0000000100000000" =>
Result <= (Reg1 OR Reg2); --boolean XNOR
When OTHERS =>
Result <= "--------";
end case;
end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); --only 4-bits, split the 8-bit to two 4-bits.
end calculation;
