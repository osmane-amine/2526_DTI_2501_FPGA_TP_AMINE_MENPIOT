library ieee;
use ieee.std_logic_1164.all;

entity basculed is
    port(
        clk:in std_logic;
        d:in std_logic;
        rst:in std_logic;
        en:in std_logic;
        q:out std_logic
    );
end entity basculed;

architecture basculedarch of basculed is
begin
    process(clk,rst)
    begin
        if (rst = '0') then
            q <= '0';
        elsif (rising_edge(clk)) then
            if (en = '1') then
                q <= d;
            end if;
        end if;
    end process;
end architecture basculedarch;