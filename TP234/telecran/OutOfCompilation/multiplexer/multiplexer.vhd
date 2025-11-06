library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexer is
    port(
        i_sel:in std_logic_vector(3 downto 0);
        i_en:in std_logic;
        o_led:out std_logic_vector(9 downto 0)
    );
end entity multiplexer;

architecture archmultiplexer of multiplexer is
    signal led:std_logic_vector(9 downto 0);
begin
    process(i_sel,i_en)
        variable sel:integer range 0 to 9;
    begin
        if (i_en = '1') then
            sel := to_integer(unsigned(i_sel));
            led <= (others => '0');
            led(sel) <= '1';
        else
            led <= (others => '0');
        end if;
    end process;
    o_led <= led;
end architecture archmultiplexer;



