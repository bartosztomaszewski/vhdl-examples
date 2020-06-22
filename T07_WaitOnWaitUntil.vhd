entity T07_WaitOnWaitUntil is
end entity;

architecture sim of T07_WaitOnWaitUntil is
-- place to declare signals
-- signal MySignal : integer := 0;
	signal CountUp : integer := 0;
	signal CountDown : integer := 10;
	
begin
	
	process is
	-- place to declare variables
	-- variable Myvariable : integer := 0;
	begin
		CountDown <= CountDown - 1;
		CountUp <= CountUp + 1;
		wait for 10 ns;
	end process;
	
	process is
	begin
		wait on CountUp, CountDown;
		report "CountUp=" & integer'image(CountUp) & ", CountDown=" & integer'image(CountDown);
	
	end process;
	
	process is
	begin
		
		wait until CountUp = CountDown;
		report "JACKPOT!!!";
	
	end process;

end architecture;