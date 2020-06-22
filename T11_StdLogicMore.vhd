library IEEE;
use IEEE.std_logic_1164.all;

entity T11_StdLogicMore is
end entity;

architecture sim of T11_StdLogicMore is
-- place to declare signals
-- signal MySignal : std_logic := 'Z'
	signal MySignal1 : std_logic_vector(7 downto 0);
	signal MySignal2 : std_logic_vector(7 downto 0) := (others => '0');
	signal MySignal3 : std_logic_vector(7 downto 0) := (others => '1');
	signal MySignal4 : std_logic_vector(7 downto 0) := x"AA";
	signal MySignal5 : std_logic_vector(0 to 7) := "10101010";
	signal MySignal6 : std_logic_vector(7 downto 0) := "00000001";

begin
	-- shift register
	process is
	-- declare variables
	begin
		
		wait for 10 ns;
		
		--for i in 7 downto 1 loop
		for i in MySignal6'left downto MySignal6'right + 1 loop --left most / right most
			MySignal6(i) <= MySignal6(i-1);
		end loop;
		
		--MySignal6(0) <= MySignal(7);
		MySignal6(MySignal6'right) <= MySignal6(MySignal6'left);
		
	end process;

end architecture;