library ieee;
use ieee.std_logic_1164.all;

entity NRZI is
        port(
         x,clk,reset : in std_logic;
         y : out std_logic
         );
end NRZI;

architecture arch of NRZI is
 
   type state is (NRZI0,NRZI1);
   signal actual_state, next_state : state;

   begin
   stare_register : process(clk, reset)
   begin
		if(reset ='1') then
			actual_state <= NRZI1;
		else if(rising_edge(clk)) then
			actual_state <= next_state;
			end if;
		end if;
	end process;

next_state_proc : process(x,actual_state)
begin


      case actual_state is
          when NRZI1 =>
                     if(x='0')then
                         next_state <=NRZI0;
                         y<='0';
                     else
                          next_state <= NRZI1;
                          y<='1';
                      end if;
           when NRZI0 =>
                     if(x='0')then
                         next_state <=NRZI1;
                         y<= '1';
                     else
                          next_state <= NRZI0;
                          y<='0';
                      end if;
                end case;
            end process;
        end arch;
                       
