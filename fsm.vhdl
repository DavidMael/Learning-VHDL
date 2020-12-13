library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        state: out integer
    );
end fsm;

architecture behave of fsm is
    constant clk_c : time := 10 ns;
    signal clk : bit;
    signal statelocal : integer;
begin
    clk_process: process
    begin
        clk <= '0';
        wait for clk_c/2;
        clk <= '1';
        wait for clk_c/2;

        if NOW > 100 ns then
            wait;
        end if;
    end process; 

    state_process: process 
    begin
        state <= statelocal;
        report integer'image(statelocal);
    end process;


    fsm_process: process (clk)
    begin
        --should be no need to check again for clk edge
        if clk = '1' then
            case statelocal is
                when 0 => 
                    statelocal <= 1;
                when 1 => 
                    statelocal <= 2;
                when 2 => 
                    statelocal <= 0;
                when others => 
                    statelocal <= 0;
            end case; 
        end if;
    end process; 
end behave;



