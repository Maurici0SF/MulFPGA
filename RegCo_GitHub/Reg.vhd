library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity Reg is
	port (clk,cargar,disparo: in STD_LOGIC;
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			Display1,Display2,Display3,Display4 :	out STD_LOGIC_VECTOR(6 downto 0));
end Reg;

architecture behav of Reg is
	
	component Decoder
	port(bcd : in std_logic_vector(3 downto 0);
		  Sal7seg : out std_logic_vector(6 downto 0));
	end component;
	
	component divisor
	port (clk50mhz: 	in STD_LOGIC;
			clk:		out STD_LOGIC);
	end component;
	
	component DecToSpike
	port (clk,cargar: in STD_LOGIC;
			U: in STD_LOGIC_VECTOR(3 downto 0);
			SpikeToReg:	out STD_LOGIC);
   end component;
	
	component Registro
	port (Spike,clk,cargar,disparo: in STD_LOGIC;
			Spike_Disparado: out STD_LOGIC;
			Reg9Bits:	out STD_LOGIC_VECTOR(8 downto 0));
	end component;
	
	component Adder
	port (Spike,CLK: 	in STD_LOGIC;
			Num:		out STD_LOGIC_VECTOR(3 downto 0));
   end component;
	
	signal nCLK : STD_LOGIC;
	signal SpikeToRegistro : STD_LOGIC;
	signal auxReg9Bits : STD_LOGIC_VECTOR(8 downto 0);
	signal SpikeDisparado : STD_LOGIC;
	signal NumSal : STD_LOGIC_VECTOR(3 downto 0);
	
begin
	
	Div : divisor port map(CLK,nCLK);
	
	BtoS : DecToSpike port map(nCLK,cargar,Data,SpikeToRegistro);
	
	Re : Registro port map(SpikeToRegistro,nCLK,cargar,disparo,SpikeDisparado,auxReg9Bits);
	
	Seg7_1 : Decoder port map(auxReg9Bits(3 downto 0),Display1);
	
	Seg7_2 : Decoder port map(auxReg9Bits(7 downto 4),Display2);
	
	Seg7_3 : Decoder port map("000" & auxReg9Bits(8),Display3);
	
	Sum : Adder port map(SpikeDisparado,nCLK,NumSal);
	
	Seg7_Final : Decoder port map(NumSal,Display4);
	
end behav;