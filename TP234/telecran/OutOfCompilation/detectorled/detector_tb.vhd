library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector_tb is
end entity detector_tb;

architecture archdetector_tb of detector_tb is
    signal tb_i_clk_50: std_logic := '0';
    signal tb_i_rst_n:std_logic:='0';
    signal tb_i_en:std_logic:='0';
    signal tb_i_ch_a:std_logic:='0';
    signal tb_i_ch_b:std_logic:='0';
    signal tb_o_count:std_logic_vector(3 downto 0);
    signal tb_o_led:std_logic_vector(9 downto 0);
    constant clk_period : time := 20 ps;
begin
    uut: entity work.detector
        port map(
            i_clk_50 => tb_i_clk_50,
            i_rst_n => tb_i_rst_n,
            i_en => tb_i_en,
            i_ch_a => tb_i_ch_a,
            i_ch_b => tb_i_ch_b,
            o_count => tb_o_count,
            o_led => tb_o_led
        );
    -- Clock generation
    clk_process:process
    begin
        tb_i_clk_50 <= '0';
        wait for clk_period / 2;
        tb_i_clk_50 <= '1';
        wait for clk_period / 2;
    end process;
    -- Signal generation
    sig_gen_process:process
    begin
        --Initialisation
        tb_i_ch_a <= '0';
        tb_i_ch_b <= '0';
        tb_i_en <= '0';
        tb_i_rst_n <= '0';
        wait for 50 ps;
        tb_i_rst_n <= '1';
        wait for 50 ps;
        
        -- Enable counting
        tb_i_en <= '1';
        
        -- Simulate encoder signals
--        for i in 0 to 10 loop
  --          tb_i_ch_a <= '1';
    --        wait for 10 us;
      --      tb_i_ch_b <= '1';
        --    wait for 10 us;
          --  tb_i_ch_a <= '0';
            --wait for 10 us;
--            tb_i_ch_b <= '0';
  --          wait for 10 us;
    --    end loop;
      --  wait for 50 us;
        for i in 0 to 10 loop
            tb_i_ch_b <= '1';
            wait for 10 us;
            tb_i_ch_a <= '1';
            wait for 10 us;
            tb_i_ch_b <= '0';
            wait for 10 us;
            tb_i_ch_a <= '0';
            wait for 10 us;
        end loop;
        wait for 50 us;
        -- Disable counting
        tb_i_en <= '0';
        wait for 100 us;

        -- Finish simulation
        wait;
    end process;
end architecture archdetector_tb;