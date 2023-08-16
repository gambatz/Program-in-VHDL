library ieee;
use ieee.std_logic_1164.all;

entity NRZI_testbench is
end NRZI_testbench;

architecture testbench of NRZI_testbench is

	signal x,clk,reset, y : std_logic;
	signal input_sequence : std_logic_vector(0 to 7) := "10001011";
	constant clk_period : time := 50 ns;

	component NRZI is	
		port(	
			x,clk,reset : in std_logic;
			y   : out std_logic
			);
	end component;

begin

	u1 : NRZI port map (x,clk,reset,y);
	
	genclk : process
		begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
	end process;
	
	tb : process
		begin
			reset <= '1';
			x <= '0';
			wait for 5*clk_period/2;
			reset <= '0';
			for i in 0 to 7 loop
				x <= input_sequence(i);
				wait for clk_period;
			end loop;
			wait;
	end process;

end testbench;