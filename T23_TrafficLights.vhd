library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T23_TrafficLights is
generic(ClockFrequency : integer);
port(
	Clk         : in std_logic;
	nRst        : in std_logic; --negative reset / reset when 0
	NorthRed    : out std_logic;
	NorthYellow : out std_logic;
	NorthGreen  : out std_logic;
	WestRed     : out std_logic;
	WestYellow  : out std_logic;
	WestGreen   : out std_logic
	);
end entity;

architecture rtl of T23_TrafficLights is
	
	type t_State is (NorthNext, StartNorth, North, StopNorth,
					 WestNext, StartWest, West, StopWest);
	signal State : t_State;
	
	signal Counter : integer range 0 to ClockFrequency * 60;
	
begin

	process(Clk) is
		
		--Procedure for changing state after a given time
		procedure ChangeState(ToState : t_State;
							  Minutes : integer := 0;
							  Seconds : integer := 0) is
			variable TotalSeconds : integer;
			variable ClockCycles  : integer;
		begin
			TotalSeconds := Seconds + Minutes * 60;
			ClockCycles  := TotalSeconds * ClockFrequency - 1;
			if Counter = ClockCycles then
				Counter <= 0;
				State   <= ToState;
			end if;
		
		end procedure;
	
	begin
		if rising_edge(Clk) then
			if nRst = '0' then
				--Reset values
				State <= NorthNext;
				NorthRed    <= '1';
				NorthYellow <= '0'; 
				NorthGreen  <= '0';
				WestRed     <= '1';
				WestYellow  <= '0';
				WestGreen   <= '0';
				
				
			else
				NorthRed    <= '0';
				NorthYellow <= '0'; 
				NorthGreen  <= '0';
				WestRed     <= '0';
				WestYellow  <= '0';
				WestGreen   <= '0';
				
				Counter <= Counter + 1;
				
				case State is
					when NorthNext =>
						NorthRed <= '1';
						WestRed  <= '1';
						ChangeState(StartNorth, Seconds => 5);
						
					when StartNorth =>
						NorthRed    <= '1';
						WestRed     <= '1';
						NorthYellow <= '1';
						ChangeState(North, Seconds => 5);
						
					when North =>
						NorthGreen <= '1';
						WestRed    <= '1';
						ChangeState(StopNorth, Minutes => 1);
						
					when StopNorth =>
						WestRed     <= '1';
						NorthYellow <= '1';
						ChangeState(WestNext, Seconds => 5);
						
					when WestNext =>
						NorthRed <= '1';
						WestRed  <= '1';
						ChangeState(StartWest, Seconds => 5);
						
					when StartWest =>
						NorthRed   <= '1';
						WestRed    <= '1';
						WestYellow <= '1';
						ChangeState(West, Seconds => 5);
						
					when West =>
						NorthRed  <= '1';
						WestGreen <= '1';
						ChangeState(StopWest, Minutes => 1);
						
					when StopWest =>
						NorthRed   <= '1';
						WestYellow <= '1';
						ChangeState(NorthNext, Seconds => 5);
						
				end case;
				
				
			end if;
		end if;
	end process;

end architecture;