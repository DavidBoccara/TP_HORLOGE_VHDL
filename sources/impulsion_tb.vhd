library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity impulsion_tb is	--entité vide
end entity ; -- impulsion_tb

architecture 	testbench of impulsion_tb is
    constant CLK_DIVIDER : integer := 50000000;	--diviseur de 50MHz
    constant PERIOD      : time := 2000 ps;		-- 1/50MHz
 
    signal clk    : std_logic := '1';
    signal rst    : std_logic := '0';
    signal top_1s : std_logic;

begin
		impulsion : entity work.impulsion(rtl)
			generic map(CLK_DIVIDER => CLK_DIVIDER)
			port map(
				clk		=> clk,
				rst 	=> rst,
				top_1s 	=> top_1s);
		clk <= not clk after PERIOD / 2;
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);
 
      
        rst <= '1';
 
        wait;
    end process;		

end architecture ; -- 	testbench