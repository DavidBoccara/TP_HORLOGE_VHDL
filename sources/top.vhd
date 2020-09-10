library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

                                                       -- Index | Description              | Signal carte        | FPGA
entity top is port                                     ---------+--------------------------+---------------------+---------------------------------
	(
	--synthesis read_comments_as_HDL on
	--max10_clk1_50 : in  std_logic
	--synthesis read_comments_as_HDL off
	--synthesis translate_off
	 pll1_c0 		: in  std_logic
	--synthesis translate_on
	; key           : in  std_logic_vector(1 downto 0) := (others => '1')                                       -- 1     | Affichage horloge/alarme | key1                | A7
	; hex0          : out std_logic_vector(7 downto 0) --       | 7-segments #0 (droite)   | hex07...hex00       | D15,C17,D17,E16,C16,C15,E15,C14
	; hex1          : out std_logic_vector(7 downto 0) --       | 7-segments #1            | hex17...hex10       | A16,B17,A18,A17,B16,E18,D18,C18
	; hex2          : out std_logic_vector(7 downto 0) --       | 7-segments #2            | hex27...hex20       | A19,B22,C22,B21,A21,B19,A20,B20
	; hex3          : out std_logic_vector(7 downto 0) --       | 7-segments #3            | hex37...hex30       | D22,E17,D19,C20,C19,E21,E22,F21
	; hex4          : out std_logic_vector(7 downto 0) --       | 7-segments #4            | hex47...hex40       | F17,F20,F19,H19,J18,E19,E20,F18
	; hex5          : out std_logic_vector(7 downto 0) --       | 7-segments #5 (gauche)   | hex57...hex50       | L19,N20,N19,M20,N18,L18,K20,J20
	; ledr          : out std_logic_vector(9 downto 0) --       | LEDs Rouges              | ledr9...ledr0       | B11,A11,D14,E14,C13,D13,B10,A10,A9,A8

	);	
end entity top;

architecture rtl of top is

--<======================= DÉBUT DE LA SECTION 1
-- Instructions : seules les valeurs 'x' et 'y' doivent être modifiées
-- Le reste du code doit rester inchangé.

	--synthesis translate_off
	constant CLK_DIVIDER : natural := 50; 
	--synthesis translate_on
	--synthesis read_comments_as_HDL on
--	constant CLK_DIVIDER : natural := 50000000;
	--synthesis read_comments_as_HDL off
-- DÉBUT DE LA SECTION 1  =======================>


--
-- Déclarer ici tous vos signaux internes
--
--

	signal cnt: std_logic_vector(25 downto 0);
    signal rst    : std_logic;
    signal mode   : std_logic :='0';
    signal push1 : std_logic ;
    signal push2 : std_logic ;
    signal seconde_A, minute_A, seconde_B, minute_B, heure_A, heure_B: std_logic_vector(3 downto 0) := (others => '0') ;
    signal seconde_alarme_A, minute_alarme_A, seconde_alarme_B, minute_alarme_B, heure_alarme_A, heure_alarme_B: std_logic_vector(3 downto 0) := (others => '0') ;
  	--synthesis read_comments_as_HDL on
	--signal pll1_c0		: std_logic;			
	--synthesis read_comments_as_HDL   off
	signal pll1_locked	: std_logic;
    signal top_1s : std_logic;

begin

--======================================================================================================================
-- Gestion des horloges
--======================================================================================================================
--synthesis read_comments_as_HDL on
--pll1 : entity work.pll1 port map
--	( inclk0      => max10_clk1_50           
--	, c0          => pll1_c0             
--	, locked      => pll1_locked             
--	);
--
--process(pll1_locked ,pll1_c0)
--begin
--if pll1_locked='0' then
--	rst <= '1';
--elsif rising_edge(pll1_c0) then
--	rst <= '0';
--end if;
--end process;
--synthesis read_comments_as_HDL off

--======================================================================================================================
-- Filtres anti-rebonds
--======================================================================================================================

process(key,pll1_c0, push1,push2)

begin
if (rising_edge(pll1_c0)) then	
	cnt <= std_logic_vector(unsigned(cnt)  + 1);

		if unsigned (cnt) = 5000000  then
			cnt <= (others => '0');
			
			if key(1) = '0' and key(0) = '1'then
			push1 <= '0';
			elsif key(1) = '1' and  key(0) = '0' then
			push2 <= '0';
			elsif key(0) = '0' and key(1) = '0' then
				mode <= not(mode);
			end if;
				
		else
			push1 <='1';
			push2 <='1';
		end if;
end if; 
end process;
--======================================================================================================================
-- Générateur d'impulsions
--======================================================================================================================



impulsion : entity work.impulsion generic map
	( CLK_DIVIDER => CLK_DIVIDER
	) port map
	( clk    => pll1_c0
	, rst    => rst
	, top_1s    => top_1s
	);


ctrl : entity work.ctrl port map
	( clk   			=> pll1_c0
	, rst  	 			=> rst
	, top_1s 			=> top_1s
	, seconde_A 		=> seconde_A
	, seconde_B 		=> seconde_B
	, minute_A 			=> minute_A
	, minute_B 			=> minute_B
	, heure_A 			=> heure_A
	, heure_B 			=> heure_B
	,seconde_alarme_A 	=> seconde_alarme_A
	,seconde_alarme_B 	=> seconde_alarme_B
	,minute_alarme_A	=> minute_alarme_A
	,minute_alarme_B 	=> minute_alarme_B
	,heure_alarme_A 	=> heure_alarme_A
	,heure_alarme_B 	=> heure_alarme_B 
	,push1 				=> push1
	,push2 				=> push2
	,mode 				=> mode
	,ledr =>ledr

	);
--======================================================================================================================
-- Gestion de l'affichage
--======================================================================================================================
afficheur : entity work.afficheur port map
	( clk   		=> pll1_c0
	, rst   		=> rst
	, seconde_A  	=> seconde_A                  --in  std_logic                    -- Horloge ou alarme
	, seconde_B  	=> seconde_B
	, minute_A		=> minute_A
	, minute_B		=> minute_B
	, heure_A		=> heure_A
	, heure_B		=> heure_B
	,seconde_alarme_A 	=> seconde_alarme_A
	,seconde_alarme_B 	=> seconde_alarme_B
	,minute_alarme_A	=> minute_alarme_A
	,minute_alarme_B 	=> minute_alarme_B
	,heure_alarme_A 	=> heure_alarme_A
	,heure_alarme_B 	=> heure_alarme_B 
	, LED_OUT_SECOND_A		=> hex1
	, LED_OUT_SECOND_B		=> hex0
	, LED_OUT_MINUTE_A		=> hex3
	, LED_OUT_MINUTE_B		=> hex2
	, LED_OUT_HEUR_A		=> hex5
	, LED_OUT_HEUR_B		=> hex4
	,mode => mode
	);

end architecture rtl;
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
--synthesis translate_off
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity top_tb is
end entity top_tb;

architecture testbench of top_tb is
	-- déclarez ici vos signaux INITIALISÉS
	
	signal pll1_c0, rst : std_logic := '0';
	signal cnt: natural := 0;
		--synthesis read_comments_as_HDL on
	--constant period      : time := 2 ns;
	--synthesis read_comments_as_HDL off
	--synthesis translate_off
	constant period      : time := 0.02 sec;
	--synthesis translate_on
	 
-- affectez vos signaux
	component top is
	port( pll1_c0        	: in  std_logic
		--;key         	: in  std_logic_vector(1 downto 0)
		--;sw				: in std_logic_vector(9 downto 0)
		);
	end component;
	
begin
top_test : top port map (pll1_c0 => pll1_c0);

		pll1_c0 <= not pll1_c0 after period / 2;
    process is
    begin
        wait until rising_edge(pll1_c0);
        wait until rising_edge(pll1_c0);
end process;

-- mappez votre entité "top"

end architecture testbench;
--synthesis translate_on
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
--##############################################################################################################################################################
