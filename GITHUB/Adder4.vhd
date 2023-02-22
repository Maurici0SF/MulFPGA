library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Adder4 is
	port (CLK,C   :  in STD_LOGIC;
			NumE,NumE2,NumE3  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
end Adder4;

architecture behav of Adder4 is
	signal n : STD_LOGIC_VECTOR(4 downto 0) := "00000";
	signal Ca : std_logic_vector(3 downto 0) := "0000";
	signal aux : std_logic_vector(4 downto 0) := "00000";
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if n = "01010" then
				n <= "00000" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "01011" then
				n <= "00001" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "01100" then
				n <= "00010" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "01101" then
				n <= "00011" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "01110" then
				n <= "00100" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "01111" then
				n <= "00101" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "10000" then
				n <= "00110" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "10001" then
				n <= "00111" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "10010" then
				n <= "01000" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			elsif n = "10011" then
				n <= "01001" + NumE + NumE2 + NumE3 + C;
				Ca <= "0001";
			else
				n <= n + NumE + NumE2 + NumE3 + C;
				Ca <= "0000";
			end if;
		end if;
		NumS <= n(3 downto 0);
		Carry <= Ca;
	end process;
end behav;
