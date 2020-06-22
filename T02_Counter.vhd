----------------------------------------------------
-- VHDL code for n-bit counter (ESD figure 2.6)
-- by Weijun Zhang, 04/2001
--
-- this is the behavior description of n-bit counter
-- another way can be used is FSM model. 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity T02_Counter is

generic(n: natural :=2);
port(	clock:	in std_logic;
	clear:	in std_logic;
	count:	in std_logic;
	Q:	out std_logic_vector(n-1 downto 0)
);
end T02_Counter;

----------------------------------------------------

architecture behv of T02_Counter is		 	  
	
    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the T02_Counter
	process is
    -- process(clock, count, clear)
    begin
	 report "Hello World111";
	-- if clear = '1' then
 	    -- Pre_Q <= Pre_Q - Pre_Q;
	-- elsif (clock='1' and clock'event) then
	    -- if count = '1' then
		-- report "Hello World2222";
		Pre_Q <= Pre_Q + 1;
		wait for 10 ns;
	    -- end if;
	-- end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;
	-- report Q;

end behv;

-----------------------------------------------------