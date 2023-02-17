library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity ArregloRegistros is
	port (clk,cargar,disparo: in STD_LOGIC;
			op : in STD_LOGIC_VECTOR(1 downto 0);
			SelecReg : in STD_LOGIC_VECTOR(1 downto 0);
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			Display,D1,D2,D3,D4,D5 :	out STD_LOGIC_VECTOR(6 downto 0));
end ArregloRegistros;

architecture behav of ArregloRegistros is
	
	component Reg16
	port (CLK,cargar: 	in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(3 downto 0);
			Op : in STD_LOGIC_VECTOR(1 downto 0);
			Num: out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component Reg
	port (clk,cargar,disparo: in STD_LOGIC;
			Data: in STD_LOGIC_VECTOR(3 downto 0);
			Display:	out STD_LOGIC_VECTOR(3 downto 0);
			DataOUT : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Mux
	port (op	: 	in STD_LOGIC_VECTOR(1 downto 0);
			Reg1,Reg2,Reg3,Reg4 : in STD_LOGIC_VECTOR(3 downto 0);
			SalNumReg	:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Decoder
	port(bcd : in std_logic_vector(3 downto 0);
		  Sal7seg : out std_logic_vector(6 downto 0));
	end component;

	component divisor
	port (clk50mhz: 	in STD_LOGIC;
			clk:		out STD_LOGIC);
	end component;	
	
	signal nCLK : STD_LOGIC;
	signal D_out1,D_out2,D_out3,D_out4,Data_OutF : STD_LOGIC_VECTOR(3 downto 0);
	signal Reg16_Num : STD_LOGIC_VECTOR(15 downto 0);
	signal d : STD_LOGIC_VECTOR(3 downto 0);
	signal d22 : STD_LOGIC_VECTOR(3 downto 0);

begin

	Div : divisor port map(CLK,nCLK);
	
	Reg_16 : Reg16 port map(nCLK,cargar,Data,op,Reg16_Num);
	
	R1 : Reg port map(nCLK,cargar,disparo,Reg16_Num(3 downto 0),d,D_out1);
	
	R2 : Reg port map(nCLK,cargar,disparo,Reg16_Num(7 downto 4),d22,D_out2);
	
	R3 : Reg port map(nCLK,cargar,disparo,Reg16_Num(11 downto 8),d22,D_out3);
	
	R4 : Reg port map(nCLK,cargar,disparo,Reg16_Num(15 downto 12),d22,D_out4);
	
	M : Mux port map(SelecReg,D_out1,D_out2,D_out3,D_out4,Data_OutF);
	
	Seg1 : Decoder port map(Reg16_Num(3 downto 0),D1);
	
	Seg2 : Decoder port map(Reg16_Num(7 downto 4),D2);
	
	Seg3 : Decoder port map(Reg16_Num(11 downto 8),D3);
	
	Seg4 : Decoder port map(Reg16_Num(15 downto 12),D4);
	
	Seg5 : Decoder port map(d,D5);
	
	Seg7_Final : Decoder port map(Data_OutF,Display);
	
	
end behav;