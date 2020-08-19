-- this file is a module, not a test bench!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T16_GenericMux is
-- Inputs signals to this module
generic (DataWidth : integer);
port(
	-- Inputs
	Input1 : in unsigned(DataWidth-1 downto 0);
	Input2 : in unsigned(DataWidth-1 downto 0);
	Input3 : in unsigned(DataWidth-1 downto 0);
	Input4 : in unsigned(DataWidth-1 downto 0);
	
	Control : in unsigned (1 downto 0);
	
	-- Outputs
	Output : out unsigned(DataWidth-1 downto 0));
	
end entity;

architecture rtl of T16_GenericMux is -- rtl (or sim) can be changed what we like, but it tells us its test/simulation or, in this example, Register-transfer level.
-- place to declare signals
-- signal Sig : unsigned(7 downto 0) := (others => "0");
-- signal MySig : integer := 1;
	
begin
	
	process(Control, Input1, Input2, Input3, Input4) is
	-- place do declare variables
	-- variable MyVariable : integer := "0";
	begin

		case Control is
			when "00" =>
				Output <= Input4;
			when "01" =>
				Output <= Input3;
			when "10" =>
				Output <= Input2;
			when "11" =>
				Output <= Input1;
			when others =>
				Output <= (others => 'X');
		end case;

	end process;

end architecture;