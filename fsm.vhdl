library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        clk: in std_logic;
        state: out std_logic_vector (1 downto 0)
    );
end fsm;

architecture behave_fsm of fsm is
    type state_type is (one,two,three);
    signal statelocal : state_type;
    --signal clk: std_logic;
    --constant clk_period : time := 10 ns;
begin

    --clk_process: process
    --begin
    --    clk <= '0';
    --    wait for clk_period/2;
    --   clk <= '1';
    --    wait for clk_period/2;
    --end process;


    fsm_process: process (clk)
    begin
        --should be no need to check again for clk edge
        if clk = '1' then
            case statelocal is
                when one => 
                    statelocal <= two;
                    state <= "10";
                when two => 
                    statelocal <= three;
                    state <= "11";
                when three => 
                    statelocal <= one;
                    state <= "01";
                when others => 
                    statelocal <= one;
                    state <= "01";
            end case; 
        end if;
    end process; 

end behave_fsm;





