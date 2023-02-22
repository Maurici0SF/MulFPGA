library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Adder2 is
	port (CLK   :  in STD_LOGIC;
			Carry :  in STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
end Adder2;

architecture behav of Adder2 is
	signal n : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if n < "1001" then
				n <= n + Carry;
			end if;
		end if;
		NumS <= n;
	end process;
end behav;
