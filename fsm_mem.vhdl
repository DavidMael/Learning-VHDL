--ROM
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_rom is
    port(
        addr: in std_logic_vector (1 downto 0);
        data: out std_logic_vector (7 downto 0) 
    );
end fsm_rom;

architecture rom_arch of fsm_rom is
    type mem_array is array (0 to 3) of std_logic_vector (7 downto 0);
    constant rom_content: mem_array := ("00000000",
                                        "01000000",
                                        "00001000",
                                        "10001000");
begin
    data <= rom_content(to_integer(unsigned(addr)));
end rom_arch; 