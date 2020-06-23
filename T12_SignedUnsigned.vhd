-- https://www.youtube.com/watch?v=qyx-DAewCQw

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T12_SignedUnsigned is
end entity;

architecture sim of T12_SignedUnsigned is
--place to decalare signals
	signal UnsignedCounter : unsigned(7 downto 0) := (others => '0');
	signal SignedCounter : signed(7 downto 0) := (others => '0');
	
	signal Uns4 : unsigned(3 downto 0) := "1000";
	signal Sig4 : signed(3 downto 0) := "1000";
	0
	signal Uns8 : unsigned(7 downto 0) := (others => '0');
	signal Sig8 : signed(7 downto 0) := (others => '0');

begin
	process is
	begin
	
		wait for 10 ns;
		
		-- wrapping counter
		UnsignedCounter <= UnsignedCounter + 1;
		SignedCounter <= SignedCounter + 1;
		
		Uns8 <= Uns8 + Uns4;
		Sig8 <= Sig8 + Sig4;
		
	end process;


end architecture;