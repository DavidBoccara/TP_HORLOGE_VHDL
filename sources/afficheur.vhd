library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;        -- for addition & counting
	use ieee.numeric_std.all;               -- for type conversions

entity afficheur is
	port (
	LED_OUT_SECOND_A 	: 	out std_logic_vector(7 downto 0); 	-- leds des unités des secondes
	LED_OUT_SECOND_B 	: 	out std_logic_vector(7 downto 0); 	-- leds des dizaines des secondes
	LED_OUT_MINUTE_A 	: 	out std_logic_vector(7 downto 0); 	-- leds des unités des minutes
	LED_OUT_MINUTE_B 	: 	out std_logic_vector(7 downto 0); 	-- ...
	LED_OUT_HEUR_A 		: 	out std_logic_vector(7 downto 0);
	LED_OUT_HEUR_B 		: 	out std_logic_vector(7 downto 0);
	seconde_A			:	in std_logic_vector(3 downto 0) ; 	-- temps réel (A pour les unités et B pour les dizaines)
	seconde_B			:	in std_logic_vector(3 downto 0) ;	-- ...
	minute_A			:	in std_logic_vector(3 downto 0) ;
	minute_B			:	in std_logic_vector(3 downto 0) ;
	heure_A				:	in std_logic_vector(3 downto 0) ;
	heure_B				:	in std_logic_vector(3 downto 0) ;
	seconde_alarme_A	:	in std_logic_vector(3 downto 0) ; 	--temps de l'alarme (A pour les unités et B pour les dizaines)
	seconde_alarme_B	:	in std_logic_vector(3 downto 0) ; 	-- ....
	minute_alarme_A		:	in std_logic_vector(3 downto 0) ;
	minute_alarme_B		:	in std_logic_vector(3 downto 0) ;
	heure_alarme_A		:	in std_logic_vector(3 downto 0) ;
	heure_alarme_B		:	in std_logic_vector(3 downto 0) ;
  	clk					:	in std_logic;						-- clock
  	rst					:	in std_logic;						-- reset asynchrone
  	push1				:	in std_logic := '1';				-- bouton 1
  	push2				:	in std_logic := '1';				-- bouton 2
  	mode				:	in std_logic );						-- mode temps / alarme (fonctionnement flip/flop)

end afficheur;

architecture rtl of afficheur is

begin
	process( heure_A,heure_B,seconde_alarme_A,seconde_alarme_B,minute_alarme_B,minute_alarme_A,heure_alarme_A,heure_alarme_B,seconde_A,mode,seconde_B,minute_A,minute_B, rst ,clk,push2, push1)
 begin
 if rst='1' then			--initialisation à 0

		LED_OUT_SECOND_A	<= "00000000";
		LED_OUT_SECOND_B	<= "00000000";
		LED_OUT_MINUTE_A	<= "00000000";
		LED_OUT_MINUTE_B	<= "00000000";
		LED_OUT_HEUR_A	<= "00000000";
		LED_OUT_HEUR_B	<= "00000000";

elsif rising_edge(clk) then
	if mode = '0' then		-- Si mode à 0 soit temps normal (pas alarme)
	
		-- Définition de chaque allumage de led en fonction de la valeur des secondes / minutes / heures
		    
		case(seconde_A) is	
			when "0000" => LED_OUT_SECOND_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_SECOND_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_SECOND_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_SECOND_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_SECOND_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_SECOND_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_SECOND_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_SECOND_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_SECOND_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_SECOND_A <= "10010000"; -- "9" 
			when others => LED_OUT_SECOND_A <= "11000000";
		end case;
		
		case(seconde_B) is
		    when "0000" => LED_OUT_SECOND_B <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_SECOND_B <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_SECOND_B <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_SECOND_B <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_SECOND_B <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_SECOND_B <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_SECOND_B <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_SECOND_B <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_SECOND_B <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_SECOND_B <= "10010000"; -- "9" 
			when others => LED_OUT_SECOND_B <= "11000000";
		end case;
		
		case(minute_A) is
		    when "0000" => LED_OUT_MINUTE_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_MINUTE_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_MINUTE_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_MINUTE_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_MINUTE_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_MINUTE_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_MINUTE_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_MINUTE_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_MINUTE_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_MINUTE_A <= "10010000"; -- "9" 
			when others => LED_OUT_MINUTE_A <= "11000000";
		end case;
		
		case(minute_B) is
		    when "0000" => LED_OUT_MINUTE_B	<= 	"01000000"; -- "0"     
		    when "0001" => LED_OUT_MINUTE_B	 <= "01111001"; -- "1" 
		    when "0010" => LED_OUT_MINUTE_B	 <= "00100100"; -- "2" 
		    when "0011" => LED_OUT_MINUTE_B	 <= "00110000"; -- "3" 
		    when "0100" => LED_OUT_MINUTE_B	 <= "00011001"; -- "4" 
		    when "0101" => LED_OUT_MINUTE_B	 <= "00010010"; -- "5" 
		    when "0110" => LED_OUT_MINUTE_B	 <= "00000010"; -- "6" 
		    when "0111" => LED_OUT_MINUTE_B	 <= "01111000"; -- "7" 
		    when "1000" => LED_OUT_MINUTE_B	 <= "00000000"; -- "8"     
		    when "1001" => LED_OUT_MINUTE_B	 <= "00010000"; -- "9" 
			when others => LED_OUT_MINUTE_B	 <= "01000000";
		end case;
		
		case(heure_A) is
		    when "0000" => LED_OUT_HEUR_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_HEUR_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_HEUR_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_HEUR_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_HEUR_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_HEUR_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_HEUR_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_HEUR_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_HEUR_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_HEUR_A <= "10010000"; -- "9" 
			when others => LED_OUT_HEUR_A <= "11000000";
		end case;		

		case(heure_B) is
		    when "0000" => LED_OUT_HEUR_B <= "01000000"; -- "0"     
		    when "0001" => LED_OUT_HEUR_B <= "01111001"; -- "1" 
		    when "0010" => LED_OUT_HEUR_B <= "00100100"; -- "2" 
		    when "0011" => LED_OUT_HEUR_B <= "00110000"; -- "3" 
		    when "0100" => LED_OUT_HEUR_B <= "00011001"; -- "4" 
		    when "0101" => LED_OUT_HEUR_B <= "00010010"; -- "5" 
		    when "0110" => LED_OUT_HEUR_B <= "00000010"; -- "6" 
		    when "0111" => LED_OUT_HEUR_B <= "01111000"; -- "7" 
		    when "1000" => LED_OUT_HEUR_B <= "00000000"; -- "8"     
		    when "1001" => LED_OUT_HEUR_B <= "00010000"; -- "9" 
			when others => LED_OUT_HEUR_B <= "01000000";
		end case;
		
	elsif (mode='1') then	-- si mode = 1 soit la definition de l'alarme
		
		-- Définition de chaque allumage de led en fonction de la valeur des secondes / minutes / heures
		 
		case(seconde_alarme_A) is
		    when "0000" => LED_OUT_SECOND_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_SECOND_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_SECOND_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_SECOND_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_SECOND_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_SECOND_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_SECOND_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_SECOND_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_SECOND_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_SECOND_A <= "10010000"; -- "9" 
			when others => LED_OUT_SECOND_A <= "11000000";
		end case;
		
		case(seconde_alarme_B) is
		    when "0000" => LED_OUT_SECOND_B <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_SECOND_B <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_SECOND_B <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_SECOND_B <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_SECOND_B <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_SECOND_B <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_SECOND_B <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_SECOND_B <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_SECOND_B <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_SECOND_B <= "10010000"; -- "9" 
			when others => LED_OUT_SECOND_B <= "11000000";
		end case;
		
		case(minute_alarme_A) is
		    when "0000" => LED_OUT_MINUTE_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_MINUTE_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_MINUTE_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_MINUTE_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_MINUTE_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_MINUTE_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_MINUTE_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_MINUTE_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_MINUTE_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_MINUTE_A <= "10010000"; -- "9" 
			when others => LED_OUT_MINUTE_A <= "11000000";
		end case;
		
		case(minute_alarme_B) is
		    when "0000" => LED_OUT_MINUTE_B	 <= "01000000"; -- "0"     
		    when "0001" => LED_OUT_MINUTE_B	 <= "01111001"; -- "1" 
		    when "0010" => LED_OUT_MINUTE_B	 <= "00100100"; -- "2" 
		    when "0011" => LED_OUT_MINUTE_B	 <= "00110000"; -- "3" 
		    when "0100" => LED_OUT_MINUTE_B	 <= "00011001"; -- "4" 
		    when "0101" => LED_OUT_MINUTE_B	 <= "00010010"; -- "5" 
		    when "0110" => LED_OUT_MINUTE_B	 <= "00000010"; -- "6" 
		    when "0111" => LED_OUT_MINUTE_B	 <= "01111000"; -- "7" 
		    when "1000" => LED_OUT_MINUTE_B	 <= "00000000"; -- "8"     
		    when "1001" => LED_OUT_MINUTE_B	 <= "00010000"; -- "9" 
			when others => LED_OUT_MINUTE_B	 <= "01000000";
		end case;
		
		case(heure_alarme_A) is
		    when "0000" => LED_OUT_HEUR_A <= "11000000"; -- "0"     
		    when "0001" => LED_OUT_HEUR_A <= "11111001"; -- "1" 
		    when "0010" => LED_OUT_HEUR_A <= "10100100"; -- "2" 
		    when "0011" => LED_OUT_HEUR_A <= "10110000"; -- "3" 
		    when "0100" => LED_OUT_HEUR_A <= "10011001"; -- "4" 
		    when "0101" => LED_OUT_HEUR_A <= "10010010"; -- "5" 
		    when "0110" => LED_OUT_HEUR_A <= "10000010"; -- "6" 
		    when "0111" => LED_OUT_HEUR_A <= "11111000"; -- "7" 
		    when "1000" => LED_OUT_HEUR_A <= "10000000"; -- "8"     
		    when "1001" => LED_OUT_HEUR_A <= "10010000"; -- "9" 
			when others => LED_OUT_HEUR_A <= "11000000";
		end case;		

		case(heure_alarme_B) is
		    when "0000" => LED_OUT_HEUR_B <= "01000000"; -- "0"     
		    when "0001" => LED_OUT_HEUR_B <= "01111001"; -- "1" 
		    when "0010" => LED_OUT_HEUR_B <= "00100100"; -- "2" 
		    when "0011" => LED_OUT_HEUR_B <= "00110000"; -- "3" 
		    when "0100" => LED_OUT_HEUR_B <= "00011001"; -- "4" 
		    when "0101" => LED_OUT_HEUR_B <= "00010010"; -- "5" 
		    when "0110" => LED_OUT_HEUR_B <= "00000010"; -- "6" 
		    when "0111" => LED_OUT_HEUR_B <= "01111000"; -- "7" 
		    when "1000" => LED_OUT_HEUR_B <= "00000000"; -- "8"     
		    when "1001" => LED_OUT_HEUR_B <= "00010000"; -- "9" 
			when others => LED_OUT_HEUR_B <= "01000000";
		end case;


	end if;

end if;


end process;

end architecture rtl;