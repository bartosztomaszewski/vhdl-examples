library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T18_TimerTb is
end entity;

architecture sim of T18_TimerTb is
-- place for signals
	constant ClockFrequency : integer := 10;-- 100e6; -- 100 MHz
	constant ClockPeriod : time := 1000 ms / ClockFrequency; 
	
	signal Clk     : std_logic := '1';
	signal nRst    : std_logic := '0';
	signal Seconds : integer;
	signal Minutes : integer;
	signal Hours   : integer;

begin
	-- The Device under Test (DUT)
	i_Timer : entity work.T18_Timer(rtl)
	generic map(ClockFrequency => ClockFrequency)
	port map(
		Clk  => Clk,
		nRst => nRst,
		Seconds => Seconds,
		Minutes => Minutes,
		Hours => Hours); 
		
	-- Process for generating the clock
	Clk <= not Clk after ClockPeriod / 2;
	
	-- testBench sequence
	process is
	begin
		wait until rising_edge(Clk);
		wait until rising_edge(Clk);
		
		-- Take the DUT out of reset
		nRst <= '1';		
		wait;	
	end process;

end architecture;