library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Mux is
	port (op: 	in STD_LOGIC_VECTOR(1 downto 0);
			Reg1,Reg2,Reg3,Reg4 : in STD_LOGIC_VECTOR(3 downto 0);
			SalNumReg:		out STD_LOGIC_VECTOR(3 downto 0));
end Mux;

architecture behav of Mux is

begin
	SalNumReg <= Reg1 when op = "00" else
				  Reg2 when op = "01" else
				  Reg3 when op = "10" else
				  Reg4;
end behav;