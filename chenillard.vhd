library ieee;
use ieee.std_logic_1164.all;

entity chenillard is
    port(
        i_clk:in std_logic;
        i_rst_n:in std_logic;
        o_led:out std_logic_vector(9 downto 0)
    );
end entity chenillard;

architecture archchenillard of chenillard is
    signal r_led:std_logic_vector(9 downto 0) := (others => '0');
begin
    process(i_clk, i_rst_n)
    variable counter:natural range 0 to 5000000 := 0;
    variable i:natural range 0 to 9 := 0;
    begin
        if (i_rst_n = '0') then
            r_led <= (others => '0');
            counter := 0;
            i := 0;
        elsif (rising_edge(i_clk)) then
            if (counter = 5000000) then
                counter := 0;
                r_led <= (others => '0');
                r_led(i) <= '1';
                if (i = 9) then
                    i := 0;
                else
                    i := i + 1;
                end if;
            else
                counter := counter + 1;
            end if;
        end if;
    end process;
    o_led <= r_led;
end architecture archchenillard;
