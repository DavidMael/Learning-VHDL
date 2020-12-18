--ROM
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
--use ieee.std_logic_textio.all;

entity fsm_rom is
    port(
        addr: in std_logic_vector (1 downto 0);
        data: out std_logic_vector (7 downto 0) 
    );
end fsm_rom;

--architecture rom_arch of fsm_rom is
--    type mem_array is array (0 to 3) of std_logic_vector (7 downto 0);
--    constant rom_content: mem_array := ("00000000",
--                                        "01000000",
--                                        "00001000",
--                                        "10001000");
--begin
--    data <= rom_content(to_integer(unsigned(addr)));
--end rom_arch; 

architecture rom_load of fsm_rom is
    type mem_array is array (0 to 3) of std_logic_vector (7 downto 0);
    signal rom: mem_array;
    type line is access string;
    type text is file of string;
    file load_file: text;
begin
    mem_init: process
        variable inbuf: line;
        --file load_file: text open read_mode is "mem_file.load";
        variable num_words: integer := 0;
        variable word: string (1 to 8);
    begin
        file_open(load_file, "mem_file.txt");
        while not endfile(load_file) loop
            readline(load_file, word);
            --read(inbuf, word);
            rom(num_words) <= to_stdlogicvector(word);
            num_words := num_words + 1;
            if num_words > 4 then
                exit;
            end if;
        end loop;
        wait;
    end process;

    data <= rom(to_integer(unsigned(addr)));

end rom_load; 