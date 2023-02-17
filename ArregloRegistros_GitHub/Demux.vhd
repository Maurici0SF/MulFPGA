library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Demux is
	port(R : in std_logic_vector(5 downto 0);
		  Sel : in std_logic_vector(1 downto 0);
		  R1_s,R2_s,R3_s,R4_s : out std_logic_vector(5 downto 0));
end Demux;

architecture behav of Demux is

begin


end architecture behav;