library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T21_FunctionTb is
end entity;

architecture sim of T21_FunctionTb is
-- place for signals
	constant ClockFrequency : integer := 100; -- 100 MHz
	constant ClockPeriod : time := 1000 ms / ClockFrequency; 
	
	signal Clk         : std_logic := '1';
	signal nRst        : std_logic := '0';
	signal NorthRed    : std_logic;
	signal NorthYellow : std_logic;
	signal NorthGreen  : std_logic;
	signal WestRed     : std_logic;
	signal WestYellow  : std_logic;
	signal WestGreen   : std_logic;

begin
	-- The Device under Test (DUT)
	t_TrafficLights : entity work.T21_TrafficLights(rtl)
	generic map(ClockFrequency => ClockFrequency)
	port map(Clk         => Clk,
			 nRst        => nRst,
			 NorthRed    => NorthRed,
			 NorthYellow => NorthYellow,
			 NorthGreen  => NorthGreen,
			 WestRed     => WestRed,
			 WestYellow  => WestYellow,
			 WestGreen   => WestGreen
			 );
		
	-- Process for generating the clock
	Clk <= not Clk after ClockPeriod / 2;
	
	-- testBench sequence
	process is
	begin
		wait until rising_edge(Clk);
		--wait until rising_edge(Clk);
		
		-- Take the DUT out of reset
		nRst <= '1';		
		wait;	
	end process;

end architecture;