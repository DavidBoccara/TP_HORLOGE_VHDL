library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity ctrl is

  port (
	
	
	seconde_A			:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines de seconde 
	seconde_B			:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités de secondes
	minute_A			:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines de minutes 
	minute_B			:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités  de minutes 
	heure_A				:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines d'heure
	heure_B				:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités  d'heure

	seconde_alarme_A	:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines s de seconde pour définir l'alarme
	seconde_alarme_B	:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités  de secondes pour définir l'alarme
	minute_alarme_A		:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines s de minutes pour définir l'alarme
	minute_alarme_B		:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités  de minutes pour définir l'alarme
	heure_alarme_A		:	inout std_logic_vector(3 downto 0) := "0000";	-- code des dizaines s d'heure pour définir l'alarme
	heure_alarme_B		:	inout std_logic_vector(3 downto 0) := "0000";	-- code des unités  d'heure pour définir l'alarme
	
  	clk					:	in std_logic;									-- clock
  	rst					:	in std_logic;									-- reset asynchrone
  	top_1s				:	in std_logic;									-- impulsion toutes les 1 sec
  	push1				:	in std_logic := '1';							-- bouton 1 (initialisé à 1 quand il n'est pas préssé)
  	push2				:	in std_logic := '1';							-- bouton 2 (initialisé à 1 quand il n'est pas préssé)
  	mode				:	in std_logic ;									-- 2 modes (flip flop)
  	selection 			: 	inout std_logic_vector(3 downto 0);				-- selection de la donnée à modifier
  	ledr : out std_logic_vector(9 downto 0)									-- toutes les leds

  	);
	
end entity ; -- ctrl


architecture rtl of ctrl is

	
begin
 process(selection, top_1s, rst ,clk,push2, push1,seconde_A,seconde_B,minute_A,minute_B,heure_A,heure_B,mode)
 begin
	if rst='1' then				-- initialisation à 0

		
	
		seconde_A		<= "0000";
		seconde_B		<= "0000";
		minute_A 		<= "0000";
		minute_B		<= "0000";
		heure_A			<= "0000";
		heure_B 		<= "0000";
		seconde_alarme_A <= "0000";
		seconde_alarme_B <= "0000";
		minute_alarme_A <= "0000";
		minute_alarme_B <= "0000";
		heure_alarme_A <= "0000";
		heure_alarme_B <= "0000";
	
	elsif rising_edge(clk) then		-- partie synchrone

		
		if (top_1s = '1') then		--lors de l'impulsion (chaque seconde)

			if (unsigned(seconde_B) > 8) then	-- si les unités des secondes sont au dessus de 9 on incrémente les dizaines des secondes et on réinitialise les unités à 0
				seconde_A <= std_logic_vector(unsigned(seconde_A)  + 1) ;	--incrémentation des dizaines
				seconde_B		<= "0000";									-- les unités sont à 0
			else								
				seconde_B <= std_logic_vector(unsigned(seconde_B)  + 1) ;	-- incrémentation des unités
						
			end if;
										
			if unsigned( seconde_A) = 5 and unsigned( seconde_B) = 9   then			-- on réinitialise les secondes après 59 secondes
				seconde_A <= "0000";
				seconde_B <= "0000";

				if unsigned(minute_B) > 8 then		-- de même que pour les secondes
					minute_A <= std_logic_vector(unsigned(minute_A)  + 1) ;
					minute_B <= "0000";
				else
					minute_B <= std_logic_vector(unsigned(minute_B)  + 1) ;
				end if;
			end if;


			if  unsigned( minute_A) = 5 and unsigned( minute_B) = 9  and  unsigned( seconde_A) = 5 and unsigned( seconde_B)= 9   then  -- on réinitialise après 59 minutes et 59 secondes
				minute_B <= "0000";
				minute_A <= "0000";


				if (unsigned(heure_B) > 8) then		--de même pour les heures
					heure_A <= std_logic_vector(unsigned(heure_A)  + 1) ;
					heure_B <= "0000";
				else
					heure_B <= std_logic_vector(unsigned(heure_B)  + 1) ;
				end if;

			end if;

			if unsigned( heure_A) = 2 and unsigned( heure_B) = 3 and unsigned( minute_A) = 5 and unsigned( minute_B) = 9  and  unsigned( seconde_A) = 5 and unsigned( seconde_B)= 9 then 
				heure_A <= "0000";
				heure_B <= "0000";

			end if;


		elsif (mode = '0') then		-- le mode fonctionne sous un principe de flip/flop ici on s'interesse au mode = 0 donc sur le choix de l'heure
			

			if (push2 = '0') then					-- lors de l'appui du bouton 2
				if (unsigned(selection)>2) then		-- selection doit etre compris entre 0 et 2 (conversion locale de selection de binaire en décimal)
					selection <= (others => '0');	-- sinon il retourne à 0
				else
					selection <= std_logic_vector(unsigned(selection)+1);	-- incrémentation de selection de 1 si le bouton est appuyé	
				end if;
				
			end if;
			
			if (unsigned(selection) = 0) then	-- si selection = 0 on modifie les secondes
				if push1 = '0' then			--lors de l'appui du bouton 1
					if (unsigned(seconde_B) > 8) then	--incrémentation des secondes
						seconde_A <= std_logic_vector(unsigned(seconde_A)  + 1) ;
						seconde_B		<= "0000";
					else
						seconde_B <= std_logic_vector(unsigned(seconde_B)  + 1) ;
							
					end if;
					if unsigned( seconde_A) = 5 and unsigned( seconde_B) = 9 then
						seconde_A <= "0000";
						seconde_B <= "0000";
					end if;
				end if;
				
				elsif (unsigned(selection) = 1) then
					if push1 = '0' then
						if (unsigned(minute_B) > 8) then
							minute_A <= std_logic_vector(unsigned(minute_A)  + 1) ;
							minute_B		<= "0000";
						else
							minute_B <= std_logic_vector(unsigned(minute_B)  + 1) ;
								
						end if;
						if unsigned( minute_A) = 5 and unsigned( minute_B) = 9 then
							minute_A <= "0000";
							minute_B <= "0000";
						end if;
					end if;
					
				elsif (unsigned(selection) = 2) then
					if push1 = '0' then
						if (unsigned(heure_B) > 8) then
							heure_A <= std_logic_vector(unsigned(heure_A)  + 1) ;
							heure_B		<= "0000";
						else
							heure_B <= std_logic_vector(unsigned(heure_B)  + 1) ;
								
						end if;
						if unsigned( heure_A) = 2  and  unsigned( heure_B)  > 2 then
							heure_A <= "0000";
							heure_B <= "0000";
						end if;
					end if;
						
				end if;
				

			
		elsif (mode = '1') then		-- on s'interesse au mode = 1 donc sur le choix de l'heure de l'alarme
									-- comme pour le mode précédent mais pour l'alarme

			if (push2 = '0') then
				if (unsigned(selection)>2) then
					selection <= (others => '0');
				else
					selection <= std_logic_vector(unsigned(selection)+1)	;			
				end if;
				
			end if;
			if (unsigned(selection) = 0) then
				if push1 = '0' then
					if (unsigned(seconde_alarme_B) > 8) then
						seconde_alarme_A <= std_logic_vector(unsigned(seconde_alarme_A)  + 1) ;
						seconde_alarme_B		<= "0000";
					else
						seconde_alarme_B <= std_logic_vector(unsigned(seconde_alarme_B)  + 1) ;
							
					end if;
					if unsigned( seconde_alarme_A) = 5 and unsigned( seconde_alarme_B) = 9 then
						seconde_alarme_A <= "0000";
						seconde_alarme_B <= "0000";
					end if;
				end if;
				
			elsif (unsigned(selection) = 1) then
				if push1 = '0' then
					if (unsigned(minute_alarme_B) > 8) then
						minute_alarme_A <= std_logic_vector(unsigned(minute_alarme_A)  + 1) ;
						minute_alarme_B		<= "0000";
					else
						minute_alarme_B <= std_logic_vector(unsigned(minute_alarme_B)  + 1) ;
							
					end if;
					if unsigned( minute_alarme_A) = 5 and unsigned( minute_alarme_B) = 9 then
						minute_alarme_A <= "0000";
						minute_alarme_B <= "0000";
					end if;
				end if;
				
			elsif (unsigned(selection) = 2) then
				if push1 = '0' then
					if (unsigned(heure_alarme_B) > 8) then
						heure_alarme_A <= std_logic_vector(unsigned(heure_alarme_A)  + 1) ;
						heure_alarme_B		<= "0000";
					else
						heure_alarme_B <= std_logic_vector(unsigned(heure_alarme_B)  + 1) ;
							
					end if;
					if unsigned( heure_alarme_A) = 2  and  unsigned( heure_alarme_B)  > 3 then
						heure_alarme_A <= "0000";
						heure_alarme_B <= "0000";
					end if;
				end if;
					
			end if;

		end if;

		--si l'heure est la meme que celle défini dans l'alarme alors on allume toutes les leds
		if ((seconde_A = seconde_alarme_A) and (seconde_B = seconde_alarme_B) and (minute_A = minute_alarme_A) and (minute_B = minute_alarme_B) and (heure_A = heure_alarme_A) and (heure_B = heure_alarme_B) ) then
			ledr <= "1111111111";
		else 
			ledr <= "0000000000"; --sinon elles sont éteintes
		end if;
	end if;
end process ;

end architecture ; -- rtl

	
		