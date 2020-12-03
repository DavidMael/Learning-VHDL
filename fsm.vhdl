library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        sss: out std_logic_vector (1 downto 0);
        ccc: out bit
    );
end fsm;

architecture behave of fsm is
    constant clk_c : time := 10 ns;
    signal clk : bit;
    signal state : std_logic_vector (1 downto 0);
begin
    clk_process: process
    begin
        clk <= '0';
        ccc <= '0';
        wait for clk_c/2;
        clk <= '1';
        ccc <= '1';
        wait for clk_c/2;
    end process; 

    fsm_process: process (clk)
    begin
        --should be no need to check again for clk edge
        if clk = '1' then
            case state is
                when "00" => 
                    state <= "01";
                    sss <= "01";
                when "01" => 
                    state <= "10";
                    sss <= "10";
                when "10" => 
                    state <= "00";
                    sss <= "00";
                when others => 
                    state <= "00";
                    sss <= "00";
            end case; 
        end if;
    end process; 
end behave;



