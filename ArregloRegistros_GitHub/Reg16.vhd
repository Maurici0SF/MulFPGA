library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Reg16 is
	port (CLK,cargar: 	in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(3 downto 0);
			Op : in STD_LOGIC_VECTOR(1 downto 0);
			Num: out STD_LOGIC_VECTOR(15 downto 0));
end Reg16;

architecture behav of Reg16 is
	
begin
	process(CLK)
	begin
		if cargar = '1' then
			if op="00" then
				Num(3 downto 0)<=SW;
			elsif op="01" then
				Num(7 downto 4)<=SW;
			elsif op="10" then
				Num(11 downto 8)<=SW;
			elsif op="11" then
				Num(15 downto 12)<=SW;
			end if;
		end if;
	end process;
end behav;