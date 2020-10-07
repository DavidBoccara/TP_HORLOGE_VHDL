library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
entity ctrl_tb is
end entity ; -- ctrl_tb

architecture 	testbench of ctrl_tb is
    --constant frequency : integer := 50000000;
    --constant period      : time := 20000 ps;
    constant CLK_DIVIDER : integer := 50;
    constant period      : time := 0.02 sec;
    signal clk     : std_logic := '1';
    signal rst    : std_logic := '0';
    signal top_1s : std_logic;

    signal seconde_A            :    std_logic_vector(3 downto 0) := "0000";
    signal seconde_B           :   std_logic_vector(3 downto 0) := "0000";
    signal minute_A            :    std_logic_vector(3 downto 0) := "0000";
    signal minute_B            :    std_logic_vector(3 downto 0) := "0000";
    signal heure_A         :    std_logic_vector(3 downto 0) := "0000";
    signal heure_B         :    std_logic_vector(3 downto 0) := "0000";
    signal mode   : std_logic :='0';
    signal push1 : std_logic :='1';
    signal push2 : std_logic :='1';

begin

        ctrl : entity work.ctrl(rtl)
        generic map(CLK_DIVIDER => CLK_DIVIDER)
            port map(
                clk => clk,
                rst => rst,
                top_1s => top_1s,            
                seconde_A => seconde_A,
                seconde_B => seconde_B,
                minute_A => minute_A,
                minute_B => minute_B,
                heure_A => heure_A,
                heure_B => heure_B,
                push1 => push1,
                push2  => push2,
                mode   => mode
                );


      

		clk <= not clk after period / 2;
    entree1 : process
    begin

 
        wait until rising_edge(clk);
        wait until rising_edge(clk);
 
      
        rst <= '0';
		
		
 
        wait;
    end process entree1;

	entree2 : process	
	begin
		top_1s <= '0';
		wait for 990 ms;
		top_1s <= '1';
		wait for 10 ms;			--valeur reel : 10 ns
	end process entree2;	

end architecture ; -- 	testbench