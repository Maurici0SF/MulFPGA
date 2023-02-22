library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity divisor is
	port (clk50mhz: 	in STD_LOGIC;
			clk:		out STD_LOGIC);
end divisor;

architecture behav of divisor is
	constant max_count: INTEGER := 50000000;
	signal count: INTEGER range 0 to max_count;
	
begin
	process(clk50mhz)
	begin
		if clk50mhz'event and clk50mhz='1' then
			if count < max_count then 
				count <= count+1;
				clk <= '0';
			else
				count <= 0;
				clk <= '1';
			end if;
		end if;
	end process;
end behav;