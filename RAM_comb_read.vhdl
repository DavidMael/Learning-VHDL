library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--RAM with combinational read path and sequential write path
entity RAM_cr is 
    port(
        clk, wr_en: in bit;
        addr: in std_logic_vector (15 downto 0);
        data: out std_logic_vector (15 downto 0);
    );
end RAM_cr;