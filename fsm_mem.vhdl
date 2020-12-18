--ROM
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all; --must use commands ghdl -a/-e/-r --ieee=synopsys

entity fsm_rom is
    port(
        addr: in std_logic_vector (1 downto 0);
        data: out std_logic_vector (7 downto 0);
        initing: out bit 
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
    --type line is access string;
    --type text is file of string;
    file load_file: text;
begin
    mem_init: process
        variable inbuf: line;
        variable num_words: integer := 0;
        --variable mem_en: integer := 1;
        variable word: std_logic_vector (7 downto 0);
    begin
        file_open(load_file, "mem_file.txt");
        --if (men_en = 1) then

            while not endfile(load_file) loop
                readline(load_file, inbuf);
                read(inbuf, word);
                rom(num_words) <= word;
                --ensure the init code is only run for the length of the file.
                num_words := num_words + 1;
                if num_words > 4 then
                    initing <= '0';
                    --men_en := 0;
                    exit;
                else 
                    initing <= '1';
                end if;
            end loop;
            wait;

        --end if;
        
    end process;

    data <= rom(to_integer(unsigned(addr)));

end rom_load; 