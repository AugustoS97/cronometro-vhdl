
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alm_rgb_led is
    Port (clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;  
        ce_1 : in std_logic;
        rgb1_red_o : out std_logic;
        rgb1_green_o : out std_logic;
        rgb2_red_o : out std_logic;
        rgb2_green_o : out std_logic;
        sw_1 : in std_logic;
        led_1 : out std_logic_vector (7 downto 0);
        led_2 : out std_logic_vector (4 downto 0);
        led_3 : out std_logic;
        led_4 : out std_logic;
        led_5 : out std_logic       
    );
end alm_rgb_led;

architecture Behavioral of alm_rgb_led is

signal cuenta : integer range 0 to 100000000;
signal led_1s : std_logic_vector(7 downto 0);
signal led_2s : std_logic_vector(4 downto 0);
signal led_3s : std_logic;
signal led_4s : std_logic;
signal led_5s : std_logic;



 

begin

led_1 <= led_1s;
led_2 <= led_2s;
led_3 <= led_3s;
led_4 <= led_4s;
led_5 <= led_5s;

process(ce_1,clk,reset,sw_1)

begin

    if ce_1='1' then
        if (reset='1') or sw_1='1' then
            cuenta <= 0;
            led_1s <= "00000000";
            led_2s <= "00000";
            led_3s <= '0'; 
            led_4s <= '0'; 
            led_5s <= '0';  
            rgb1_green_o <= '1';
            rgb2_green_o <= '1';
            rgb1_red_o <= '0';
            rgb2_red_o <= '0';
        elsif(rising_edge(clk)) then
            rgb1_green_o <= '0';
            rgb2_green_o <= '0';
            rgb1_red_o <= '1';
            rgb2_red_o <= '1';    
            if(cuenta=100000000) then
                cuenta <= 0;
                led_1s <= not(led_1s);
                led_2s <= not(led_2s);
                led_3s <= not(led_3s);
                led_4s <= not(led_4s);
                led_5s <= not(led_5s);
            else    
                cuenta <= cuenta + 1;
            end if;
   
        end if;
    else
        led_1s <= "00000000";
        led_2s <= "00000";
        led_3s <= '0'; 
        led_4s <= '0'; 
        led_5s <= '0';
        rgb1_green_o <= '1';
        rgb2_green_o <= '1';
        rgb1_red_o <= '0';
        rgb2_red_o <= '0';
    end if;

end process;
end Behavioral;