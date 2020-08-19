library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T16_GenericMuxTb is
end entity;

architecture sim of T16_GenericMuxTb is
	
	constant DataWidth : integer := 8;

	signal Input1 : unsigned(DataWidth-1 downto 0) := x"AA";
	signal Input2 : unsigned(DataWidth-1 downto 0) := x"BB";
	signal Input3 : unsigned(DataWidth-1 downto 0) := x"CC";
	signal Input4 : unsigned(DataWidth-1 downto 0) := x"DD";
	
	signal Control : unsigned(1 downto 0) := (others => '0');
	
	signal Output : unsigned(DataWidth-1 downto 0);
	
begin

	-- An instance of T16_GenericMux with architecture rtl
	i_Mux1 : entity work.T16_GenericMux(rtl)
	generic map(DataWidth => DataWidth)
	port map(
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