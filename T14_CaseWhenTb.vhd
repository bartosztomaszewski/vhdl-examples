library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T14_CaseWhenTb is
end entity;

architecture sim of T14_CaseWhenTb is
-- place to declare signals
-- signal Sig : unsigned(7 downto 0) := (others => "0");
-- signal MySig : integer := 1;
	signal Input1 : unsigned(7 downto 0) := x"AA";
	signal Input2 : unsigned(7 downto 0) := x"BB";
	signal Input3 : unsigned(7 downto 0) := x"CC";
	signal Input4 : unsigned(7 downto 0) := x"DD";

	signal Control : unsigned (1 downto 0) := (others => '0');
	
	signal Output : unsigned(7 downto 0);
	signal Output2 : unsigned(7 downto 0);
	
begin

	process is
	begin
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= Control + 1;
		wait for 10 ns;
		Control <= "UU";
	
	end process;

	process(Control, Input1, Input2, Input3, Input4) is
	-- place do declare variables
	-- variable MyVariable : integer := "0";
	begin
		
		if Control = "00" then
			Output <= Input1;
		elsif Control = "01" then
			Output <= Input2;
		elsif Control = "10" then
			Output <= Input3;
		elsif Control = "11" then
			Output <= Input4;
		else -- "U", "X", "-"
			Output <= (others => 'X');
		end if;
		
	end process;
	
	process(Control, Input1, Input2, Input3, Input4) is
	-- place do declare variables
	-- variable MyVariable : integer := "0";
	begin

		case Control is
			when "00" =>
				Output2 <= Input4;
			when "01" =>
				Output2 <= Input3;
			when "10" =>
				Output2 <= Input2;
			when "11" =>
				Output2 <= Input1;
			when others =>
				Output2 <= (others => 'X');
		end case;

	end process;

end architecture;