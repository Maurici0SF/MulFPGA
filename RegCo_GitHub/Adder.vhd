library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Adder is
	port (Spike,CLK: 	in STD_LOGIC;
			Num:		out STD_LOGIC_VECTOR(3 downto 0));
end Adder;

architecture behav of Adder is
	signal n : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	process(CLK)
	begin
		if rising_Edge(CLK) then
			if Spike = '1' then
				n <= n + '1';
			end if;
		end if;
	end process;
	Num <= n;
end behav;