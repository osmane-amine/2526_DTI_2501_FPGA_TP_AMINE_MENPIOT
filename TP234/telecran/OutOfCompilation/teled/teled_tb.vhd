library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teled_tb is
end entity teled_tb;

architecture archteled_tb of teled_tb is
    signal clk_50:std_logic := '0';
    signal rst_n:std_logic := '0';
    signal en_not:std_logic := '1';
    signal ch_a:std_logic := '0';
    signal ch_b:std_logic := '0';
    signal led:std_logic_vector(9 downto 0);
    constant clk_period:time := 20 ns;
begin
    tld:entity work.teled
        port map(
            i_clk_50 => clk_50,
            i_rst_n => rst_n,
            i_en_not => en_not,
            i_ch_a => ch_a,
            i_ch_b => ch_b,
            o_led => led
        );
    -- Clock generation
    clk_process:process
    begin
        clk_50 <= '0';
        wait for clk_period / 2;
        clk_50 <= '1';
        wait for clk_period / 2;
    end process;
    -- Signal generation
    sigen_process:process
    begin
        --Initialisation
        ch_a <= '0';
        ch_b <= '0';
        en_not <= '1';
        rst_n <= '0';
        wait for 50 ns;
        rst_n <= '1';
        wait for 50 ns;
        
        -- Enable counting
        en_not <= '0';
        
        -- Simulate encoder signals
        for i in 0 to 10 loop
            ch_a <= '1';
            wait for 10 us;
            ch_b <= '1';
            wait for 10 us;
            ch_a <= '0';
            wait for 10 us;
            ch_b <= '0';
            wait for 10 us;
        end loop;
        wait for 50 us;
        
        -- Disable counting
        en_not <= '1';
        wait;
    end process;
end architecture archteled_tb;