library ieee;
use ieee.std_logic_1164.all;

entity fsm_tb is
end fsm_tb;

architecture behave of fsm_tb is

    component fsm is
        port (
            clk: in std_logic;
            state: out std_logic_vector (1 downto 0)
        );
    end component;
    

    signal tb_clk: std_logic;
    signal tb_state: std_logic_vector (1 downto 0);
    constant clk_period : time := 10 ns;

begin

    tb_clk_process: process
    begin
        for i in 0 to 5 loop
            tb_clk <= '0';
            wait for clk_period/2;
            tb_clk <= '1';
            wait for clk_period/2;
        end loop;

        assert false report "Six cycles over" severity failure;
    end process;


    fsm_dut: fsm port map (tb_clk, tb_state); 


end behave;