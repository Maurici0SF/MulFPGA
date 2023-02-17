library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Multiplicador is
	port (CLK,cargar,disparo,reset	:	in STD_LOGIC;
			U, V 	:  in STD_LOGIC_VECTOR(3 downto 0);
			D0,D1	:	out STD_LOGIC_VECTOR(6 downto 0));
end Multiplicador;

architecture behav of Multiplicador is
	
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
	
	component Adder2
	port (CLK   :  in STD_LOGIC;
			Carry :  in STD_LOGIC_VECTOR(3 downto 0);
			NumS	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	--Signal
	signal nCLK : STD_LOGIC;
	signal W00 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	signal muxSal : STD_LOGIC_VECTOR(3 downto 0);
	signal V00 : STD_LOGIC_VECTOR(3 downto 0);
	signal S_Disparado : STD_LOGIC;
	signal CarryOut : STD_LOGIC_VECTOR(3 downto 0);
	signal Unidades : STD_LOGIC_VECTOR(3 downto 0);
	signal Decenas : STD_LOGIC_VECTOR(3 downto 0);

	signal a : STD_LOGIC_VECTOR(3 downto 0);
begin
	
	Div : divisor port map(CLK,nCLK);
	
	R1 : Reg port map(nCLK,cargar,disparo,U,S_Disparado,a);
	
	W : RegW port map(nCLK,reset,V,V00);
	
	M : Mux2to1 port map(S_Disparado,W00,V00,muxSal);
	
	Sum : Adder port map(nCLK,muxSal,CarryOut,Unidades);

	Sum2 : Adder2 port map(nCLK,CarryOut,Decenas);
	
	Dis0 : Decoder port map(Unidades,D0);
	
	Dis1 : Decoder port map(Decenas,D1);
	
--	Dis2 : Decoder port map(muxSal,Dp1);
	
	
--	Dis3 : Decoder port map(NumE,Dp2);
	
	--Prueba para registro
--	Dis3 : Decoder port map(V00,Dp2);

--Prueba para NumE
--	Dis3 : Decoder port map(muxSal,Dp2);
--	
--	Dis4 : Decoder port map(a,Dp3);
--	
--	SpikeD <= S_Disparado;

	
end behav;