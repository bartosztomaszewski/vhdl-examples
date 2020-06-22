entity T07_IfThenElseifElse is
end entity;

architecture sim of T07_IfThenElseifElse is
-- place to declare signals
-- signal Mysignal : integer := 0
	signal CountUp : integer := 0;
	signal CountDown : integer := 10;

begin


	process is
	-- place to declare variables
	-- variable Myvariable : integer := 0
	begin
		CountUp <= CountUp + 1;
		CountDown <= CountDown - 1;
		wait for 10 ns;
	end process;
	
	
	process is
	-- place to declare variables
	-- variable Myvariable : integer := 0;
	begin
		if CountUp > CountDown then
			report "CountUp is larger";
		--elsif CountUp = 0 then
			--report "INITAL REPORT";
		elsif CountUp < CountDown then
			report "CountDown is larger";
		--elsif CountUP = 1 then
			--report "INITIAL REPORT";
		else
			report "They are equal";
		end if;
	
		wait on CountUp, CountDown;
		
	end process;
	
	
	

end architecture;