entity T09_SensitivityList is
end entity;

architecture sim of T09_SensitivityList is
-- place to decalre signals
-- signal MySignal : integer := 0;
	signal CountUp : integer := 0;
	signal CountDown : integer := 10;
begin
	process is
	-- place to decalre variables
	-- variable Myvariable : integer := 0;
	begin
		CountDown <= CountDown - 1;
		CountUp <= CountUp + 1;
		wait for 10 ns;
	end process;
	
	process is
	begin
		if CountUp < 2 then
			report "Process A!";
		end if;
		wait on CountUp, CountDown;
		
	end process;
	
	-- both processes are equal
	process(CountUp, CountDown) is
	begin
		if CountUp < 2 then
			report "Process B!";
		end if;

	end process;
	
	
end architecture;