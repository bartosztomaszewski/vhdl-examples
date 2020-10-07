library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T22_TrafficLights is
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

architecture rtl of T22_TrafficLights is
	
	--Calculate the number of clock cycles in minutes/seconds
	function CounterVal(Minutes : integer := 0;
						Seconds : integer := 0) return integer is
		variable TotalSeconds : integer;
	begin
		
		TotalSeconds := Seconds + Minutes * 60;
		return TotalSeconds * ClockFrequency - 1;
		
	end function;
	
	type t_State is (NorthNext, StartNorth, North, StopNorth,
					 WestNext, StartWest, West, StopWest);
	signal State : t_State;
	
	signal Counter : integer range 0 to ClockFrequency * 60;
	
begin

	process(Clk) is
	
	impure function CouterExpired(Minutes : integer := 0;
								  Seconds : integer := 0) return boolean is
	
	begin
		
		if Counter = CounterVal(Minutes, Seconds) then
			Counter <= 0;
			return true;
		else
			return false;
		end if;
	end function;
	
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
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= StartNorth;
						end if;
						
					when StartNorth =>
						NorthRed    <= '1';
						WestRed     <= '1';
						NorthYellow <= '1';
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= North;
						end if;
						
					when North =>
						NorthGreen <= '1';
						WestRed    <= '1';
						--If 1 min have passed
						if CouterExpired(Minutes => 1) then
							State   <= StopNorth;
						end if;
						
					when StopNorth =>
						WestRed     <= '1';
						NorthYellow <= '1';
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= WestNext;
						end if;
						
					when WestNext =>
						NorthRed <= '1';
						WestRed  <= '1';
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= StartWest;
						end if;
						
					when StartWest =>
						NorthRed   <= '1';
						WestRed    <= '1';
						WestYellow <= '1';
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= West;
						end if;
						
					when West =>
						NorthRed  <= '1';
						WestGreen <= '1';
						--If 1 min have passed
						if CouterExpired(Minutes => 1) then
							State   <= StopWest;
						end if;
						
					when StopWest =>
						NorthRed   <= '1';
						WestYellow <= '1';
						--If 5 seconds have passed
						if CouterExpired(Seconds => 5) then
							State   <= NorthNext;
						end if;
						
				end case;
				
				
			end if;
		end if;
	end process;

end architecture;