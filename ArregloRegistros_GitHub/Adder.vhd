library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Adder is
	port (Spike,CLK,cargar: 	in STD_LOGIC;
			Num:		out STD_LOGIC_VECTOR(3 downto 0));
end Adder;

architecture behav of Adder is
	signal n : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	process(CLK)
	begin
		if rising_Edge(CLK) then
			if cargar = '0' then
				if Spike = '1' then
					n <= n + '1';
				end if;
			else
				n <= "0000";
			end if;	
		end if;	
		Num <= n;
	end process;
	
end behav;