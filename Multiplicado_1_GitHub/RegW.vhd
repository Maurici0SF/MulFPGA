library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegW is
	port(clk, reset: in std_logic;
		  d: in std_logic_vector(3 downto 0);
		  q: out std_logic_vector(3 downto 0));
end RegW;

architecture behav of RegW is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '0' then
				q<="0000";
			else
				q<=d;
			end if;
		end if;
	end process;
end behav;