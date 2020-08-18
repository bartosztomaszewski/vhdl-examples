library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T15_PortMapTb is
end entity;

architecture sim of T15_PortMapTb is
-- place to declare signals
-- signal Sig : unsigned(7 downto 0) := (others => "0");
-- signal MySig : integer := 1;
	signal Input1 : unsigned(7 downto 0) := x"AA";
	signal Input2 : unsigned(7 downto 0) := x"BB";
	signal Input3 : unsigned(7 downto 0) := x"CC";
	signal Input4 : unsigned(7 downto 0) := x"DD";

	signal Control : unsigned (1 downto 0) := (others => '0');
	
	signal Output : unsigned(7 downto 0);
	
begin
	
	-- An instance of T15_Mux with architecture rtl
	i_Mux1 : entity work.T15_Mux(rtl) port map(
		Control => Control,
		Input1  => Input1,
		Input2  => Input2,
		Input3  => Input3,
		Input4  => Input4,
		Output  => Output);

	-- Testbench process	
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

end architecture;