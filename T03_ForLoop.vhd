entity T03_ForLoop is
end entity;

architecture sim of T03_ForLoop is
begin
	process is
	begin
			
			report "Hello";
			
			for i in 1 to 10 loop
				report "i=" & integer'image(i);
				
			end loop;
			
			report "Bye!";
			wait;	
	
	end process;


end architecture;