library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity 	impulsion is
generic (
	--CLK_DIVIDER : natural;
	CLK_DIVIDER  : natural := 50000000	--Diviseur
	);
  port (
  	clk			:	in std_logic;		-- Oscillateur 50MHz
  	rst			:	in std_logic;		-- Reset asynchrone
  	top_1s			:	out std_logic :='0'	-- futur impulsion toute les 1 secondes (initialisé à 0)
  	) ; 
	
end entity ; -- 	impulsion

architecture 	rtl of 	impulsion is
	signal cnt : natural:= 0;

begin

process(rst,clk)
begin

if rst='1' then		-- si reset alors remise à zéro
		cnt <= 0;
		top_1s	<='0';

elsif rising_edge(clk) then -- partie synchrone

	if 	cnt = CLK_DIVIDER - 1 then 	-- si CLK_DIVIDER-1 alors top_1s passe à l'état haut pour un cycle
		cnt <= 0;
		top_1s <= '1';					
	else 							-- sinon top_1s reste à l'état bas
		cnt <= cnt +1;
		top_1s <= '0';
	end if;
		

end if;

end process;

end architecture rtl;