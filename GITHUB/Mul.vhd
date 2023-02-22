library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Mul is
	port (CLK,cargar,disparo,reset	:	in STD_LOGIC;
			U, V, W 	:  in STD_LOGIC_VECTOR(3 downto 0);
			D0,D1	:	out STD_LOGIC_VECTOR(6 downto 0));
end Mul;

architecture behav of Mul is
	
	component Reg 
	port (clk,cargar,disparo: in STD_LOGIC;
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			S_Disparado :	out STD_LOGIC;
			aux : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Mux2to1
	port (op: 	in STD_LOGIC;
			W0,W1 : in STD_LOGIC_VECTOR(3 downto 0);
			SalW:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder
	port (CLK   :  in STD_LOGIC;
			NumE  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component divisor
	port (clk50mhz: 	in STD_LOGIC;
			clk:		out STD_LOGIC);
	end component;
	
	component Decoder
	port(bcd : in std_logic_vector(3 downto 0);
		  Sal7seg : out std_logic_vector(6 downto 0));
	end component;
	
	component RegW
	port(clk, reset: in std_logic;
		  d: in std_logic_vector(3 downto 0);
		  q: out std_logic_vector(3 downto 0));
	end component;
	

	
	component Adder4
	port (CLK,C   :  in STD_LOGIC;
			NumE,NumE2,NumE3  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Adder3
	port (CLK,C   :  in STD_LOGIC;
			NumE,NumE2  :  in STD_LOGIC_VECTOR(3 downto 0);
			Carry :  out STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Reg12 
	port (CLK,cargar: 	in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(3 downto 0);
			Op : in STD_LOGIC_VECTOR(1 downto 0);
			Num: out STD_LOGIC_VECTOR(11 downto 0));
	end component;
	
	
	
	--Signal
	signal nCLK : STD_LOGIC;
	
begin
	
	
	

	
end behav;