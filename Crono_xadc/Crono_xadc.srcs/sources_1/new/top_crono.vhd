
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_crono is
  Port (
        clk : in  STD_LOGIC;
        reset, reset_0 : in  STD_LOGIC;
		led : out std_logic_vector(6 downto 0);
        dp : out  STD_LOGIC;
		an : out std_logic_vector(7 downto 0);
        ce : in  STD_LOGIC;  
        rgb1_red_o : out std_logic;
        rgb1_green_o : out std_logic;
        rgb2_red_o : out std_logic;
        rgb2_green_o : out std_logic;
        sw_1 : in std_logic;
        sw_3 : in std_logic;  
        led_1 : out std_logic_vector(7 downto 0);
        led_2 : out std_logic_vector (4 downto 0);
        led_3 : out std_logic;
        led_4 : out std_logic;
        led_5 : out std_logic;
        sel : in std_logic_vector(2 downto 0);
        modo : in std_logic
   );
end top_crono;

architecture Behavioral of top_crono is

signal alarma_1 : std_logic;
signal led_cr : std_logic_vector(6 downto 0);
signal an_cr : std_logic_vector(7 downto 0);
signal led_xadc : std_logic_vector(6 downto 0);
signal an_xadc : std_logic_vector(7 downto 0);
signal sel_disp : std_logic_vector(7 downto 0);
signal led_1cr, led_1xadc : std_logic_vector (7 downto 0);
signal led_2cr, led_2xadc : std_logic_vector (4 downto 0);
signal led_3cr, led_4cr, led_5cr, led_6cr, led_3xadc, led_4xadc, led_5xadc, led_6xadc : std_logic;


component crono_digital
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   led : out std_logic_vector(6 downto 0);
           dp : out  STD_LOGIC;
           sw_3 : in std_logic;
		   an : out std_logic_vector(7 downto 0);
		   alarma : out std_logic;
           ce : in  STD_LOGIC       
           ); 
end component; 


component alm_rgb_led
    Port (clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;   
        ce_1 : in std_logic;
        rgb1_red_o : out std_logic;
        rgb1_green_o : out std_logic;
        rgb2_red_o : out std_logic;  
        rgb2_green_o : out std_logic;
        sw_1 : in std_logic;
        led_1 : out std_logic_vector(7 downto 0);
        led_2 : out std_logic_vector (4 downto 0);
        led_3 : out std_logic;
        led_4 : out std_logic;
        led_5 : out std_logic          
    );
    
    end component;
    
    

component top_level

    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           OT : out STD_LOGIC;
           EOC : out STD_LOGIC;
           EOS : out STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           CHANNEL : out STD_LOGIC_VECTOR (4 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (6 downto 0);
           alarm : out STD_LOGIC_VECTOR (7 downto 0)
           );
    end component;

begin

    inst_crono_digital : crono_digital
    Port map( 
           clk => clk,
           reset => reset,
		   led => led_cr,
           dp => dp,
		   an => an_cr,
		   sw_3 => sw_3,
		   alarma => alarma_1,
           ce => ce     
    ); 

    inst_alm : alm_rgb_led
    Port map( 
        clk => clk,
        sw_1 => sw_1,
        reset => reset,   
        ce_1 => alarma_1,
        rgb1_red_o => rgb1_red_o,
        rgb1_green_o => rgb1_green_o, 
        rgb2_red_o => rgb2_red_o,
        rgb2_green_o => rgb2_green_o,
        led_1 => led_1cr,
        led_2 => led_2cr,
        led_3 => led_3cr,
        led_4 => led_4cr,
        led_5 => led_5cr            
       );
            
      
inst_top_xadc : top_level

Port map (
           clk => clk,
           reset => reset,
           OT => led_3xadc,
           EOC => led_4xadc,
           EOS => led_5xadc,
           sel => sel,
           CHANNEL => led_2xadc,
           an => an_xadc,
           led => led_xadc,
           alarm => led_1xadc
);

process (modo)
begin
   if modo = '1' then
        led_1 <= led_1cr;
        led_2 <= led_2cr;
        led_3 <= led_3cr;
        led_4 <= led_4cr;
        led_5 <= led_5cr;
        led <= led_cr;        
        an <= an_cr;
   else
        led <= led_xadc;
        led_1 <= led_1xadc;
        led_2 <= led_2xadc;
        led_3 <= led_3xadc;
        led_4 <= led_4xadc;
        led_5 <= led_5xadc;
        an <= an_xadc; 
   end if;
end process; 
   
   
   
--  with sel_disp SELect
--         led <=  led_cr when "1",
--                led_xadc when "0",                      
--                "-" when others;   

--  with sel_disp SELect
--         an<=  an_cr when "00000001",
--               an_xadc when "00000000",
--                "-" when others;  

end Behavioral;



