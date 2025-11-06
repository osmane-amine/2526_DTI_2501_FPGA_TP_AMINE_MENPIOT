library ieee;
use ieee.std_logic_1164.all;

entity basculedtest is
end entity basculedtest;

architecture tb of basculedtest is
    signal tb_clk:std_logic := '0';
    signal tb_d:std_logic;
    signal tb_rst:std_logic;
    signal tb_en:std_logic;
    signal tb_q:std_logic;
begin
    dff:entity work.basculed
    port map
    (
        clk => tb_clk,
        d => tb_d,
        rst => tb_rst,
        en => tb_en,
        q => tb_q
    );

    process
    begin
        tb_rst <= '1';
        tb_d <= '0';
        wait for 10 ns;
        tb_en <= '1';
        tb_clk <= '1';
        tb_d <= '1';
        wait for 10 ns;
        tb_clk <= '0';
        wait for 10 ns;
        tb_clk <= '1';
        tb_d <= '0';
        wait for 10 ns;
        wait;
    end process;
end architecture tb;


