entity T03_Loop is
end entity;

architecture sim of T03_Loop is
begin

	process is
	begin
		report "Hello World";
		
		loop
			report "How are you?";
			-- wait for 10 ns;
			exit;
		end loop;
		
		report "Goodbye";
		-- wait;
		
	end process;
	
end architecture;