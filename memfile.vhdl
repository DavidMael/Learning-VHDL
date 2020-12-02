--figuring out file io with example from nandland.com

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity mem is
end;

architecture behave of mem is

    file_open(fvect, "memcontents.txt", read_mode);
    file_open(fres, "dump.txt", write_mode);

    while not endfile(fvect) loop
        readline(fvect, v_ILINE);
        read(v_ILINE, v_ADD_TERM1);