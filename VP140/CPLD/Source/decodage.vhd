-- Decodage d'adresse I/O

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decodage is

	port 
	(
		AH,A7,A6,A5,A4,A3,A2,A1,A0	   : in std_logic;
		nIORQ,nMREQ,nWR	   : in std_logic;
		nYMZ,nACIA0,nACIA1,LT273,HIGH : out std_logic
	);

end entity;

architecture decod of decodage is
signal adresse : std_logic_vector (7 downto 0);
begin
	adresse <= A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0;
	
	nYMZ <= '0' when ((nIORQ='0') and ((adresse=x"0F") or (adresse=x"1F") or (adresse=x"CF") or (adresse=x"DF"))) else '1';		-- x0F, x1F, xCF, xDF
	nACIA0 <='0' when ((nMREQ='0') and (AH='1') and ((adresse>=x"F0") and (adresse<=x"F2"))) else '1';		-- xFFF0..xFFF3
	nACIA1 <='0' when ((nMREQ='0') and (AH='1') and ((adresse>=x"F8") and (adresse<=x"FA"))) else '1';		-- xFFF8..xFFFB	
	LT273<=  '1' when ((nMREQ='0') and (AH='1') and (adresse=x"FF") and (nWR='0')) else '0';				-- xFFFF WR	
	HIGH<=  '1' when ((nMREQ='0') and (AH='1') and (adresse>x"EF" and adresse<x"FF") ) else '0';		-- xFF80 .. xFFFE		(désactive la memoire haute)
   
end decod; 
