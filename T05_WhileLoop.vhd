entity T05_WhileLoop is
end entity;

architecture sim of T05_WhileLoop is
begin

	process is
		variable i : integer := 0;
	begin
		
		while i < 10 loop
			
			report "i=" & integer'image(i);
			i := i + 3;
			
		end loop;
		
	
		wait;
	
	end process;
	
end architecture;