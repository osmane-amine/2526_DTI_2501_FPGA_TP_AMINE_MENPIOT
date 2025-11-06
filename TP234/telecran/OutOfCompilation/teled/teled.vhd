library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teled is
    port(
        i_clk_50: in std_logic;
        i_rst_n:in std_logic;
        i_en_not:in std_logic;
        i_ch_a:in std_logic;
        i_ch_b:in std_logic;
        o_led:out std_logic_vector(9 downto 0)
    );
end entity teled;

architecture archteled of teled is
    signal count:std_logic_vector(3 downto 0);
    signal led:std_logic_vector(9 downto 0);
    signal en:std_logic;
begin
    dtc:entity work.detector
        port map(
            i_clk_50 => i_clk_50,
            i_rst_n => i_rst_n,
            i_en => en,
            i_ch_a => i_ch_a,
            i_ch_b => i_ch_b,
            o_count => count
        );
    mux:entity work.multiplexer
        port map(
            i_sel => count,
            i_en => en,
            o_led => led
        );
    process(i_en_not)
    begin
        en <= not i_en_not;
    end process;
end architecture archteled;