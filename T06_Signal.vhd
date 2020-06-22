entity T06_Signal is
end entity;

architecture sim of T06_Signal is

	signal MySignal : integer := 0;
	
begin
		process is
			variable MyVariable : integer := 0;
		begin
			report "Hello"; 
			while MyVariable < 11 loop
			
				MyVariable := MyVariable + 1;
				MySignal <= MySignal + 1; -- signals increment when 'wait' occurs
				report "MyVariable=" & integer'image(MyVariable) & ", MySignal=" & integer'image(MySignal);
				
				
				wait for 1 ns;
			end loop;
			wait;
		end process;
end architecture;