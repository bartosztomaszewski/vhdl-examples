-- https://www.youtube.com/watch?v=wNlEaaNTxu8&t=2s
library IEEE;
use IEEE.std_logic_1164.all;

entity T10_StdfLogic is
end entity;

architecture sim of T10_StdfLogic is
-- place to decalare signals
-- signal MySignal : integer := 0;
	signal Signal1 : std_logic  := '0';
	signal Signal2 : std_logic;
	signal Signal3 : std_logic;
	
begin

	process is
	-- place to declare variables
	-- variable MyVariable : integer := 0;
	begin
	
		wait for 10 ns;
		Signal1 <= not Signal1;
	end process;

	process is
	begin
		Signal2 <= 'Z';
		Signal3 <= '0';
		wait;
		
	end process;
	
	process(Signal1) is
	begin
		if Signal1 = '0' then
			Signal2 <= 'Z';
			Signal3 <= 'Z';
		else
			Signal2 <= '1';
			Signal3 <= '1';
		end if;
	end process;


end architecture;