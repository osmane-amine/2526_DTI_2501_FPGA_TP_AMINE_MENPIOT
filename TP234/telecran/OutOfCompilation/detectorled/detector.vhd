library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector is
    port(
        i_clk_50: in std_logic;
        i_rst_n:in std_logic;
        i_en:in std_logic;
        i_ch_a:in std_logic;
        i_ch_b:in std_logic;
        o_count:out std_logic_vector(3 downto 0);
        o_led:out std_logic_vector(9 downto 0)
    );
end entity detector;

architecture archdetector of detector is
    signal a:std_logic;
    signal b:std_logic;
    signal a_p:std_logic;
    signal b_p:std_logic;
    signal count:integer range 0 to 9:=0;
begin
    process(i_clk_50,i_rst_n)
    variable counter:natural range 0 to 50000:= 0;
    begin
        if (i_rst_n = '0') then
            a <= '0';
            b <= '0';
            a_p <= '0';
            b_p <= '0';
            counter:= 0;
            count <= 0;
        elsif (rising_edge(i_clk_50)) then
            if (i_en = '1' and counter = 50000) then
                counter := 0;
                a_p <= a;
                b_p <= b;
                a <= i_ch_a;
                b <= i_ch_b;
                if ((a xor a_p) = '1') then
                    if ((a xor b) = '1') then
                        if (count < 9) then
                            count <= count+1;
                        else
                            count <= 0;
                        end if;
                    elsif (count > 0) then
                        count <= count-1;
                    else
                        count <= 9;
                    end if;
--                elsif ((b xor b_p) = '1') then
--                    if ((b xor a) = '1') then
--                        if (count > 0) then
--                            count <= count-1;
--                        else
--                            count <= 9;
--                        end if;
--                    elsif (count < 9) then
--                       count <= count+1;
--                    else
--                        count <= 0;
--                    end if;
                end if;
            elsif (i_en = '1') then
                counter := counter+1;
            else
                counter := 0;
            end if;
        end if;
    end process;
    o_count <= std_logic_vector(to_unsigned(count,4));
    with count select o_led <=
        (0 => '1', others => '0') when 9,
        (1 => '1', others => '0') when 8,
        (2 => '1', others => '0') when 7,
        (3 => '1', others => '0') when 6,
        (4 => '1', others => '0') when 5,
        (5 => '1', others => '0') when 4,
        (6 => '1', others => '0') when 3,
        (7 => '1', others => '0') when 2,
        (8 => '1', others => '0') when 1,
        (9 => '1', others => '0') when 0,
        (others => '0') when others;
end architecture archdetector;