----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2021 21:16:07
-- Design Name: 
-- Module Name: cronometro_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cronometro_top is
  Port ( 
        clk : in std_logic; 
        reset, ce, sw_alarm_reset, sw_alarm_on : in std_logic; 
        leds : out std_logic_vector (15 downto 0);
        LED : out std_logic_vector (6 downto 0);
        dp : out std_logic;
        an : out std_logic_vector(7 downto 0); 
        led1_rgb, led2_rgb : out std_logic_vector (1 downto 0)
  );
end cronometro_top;

architecture Behavioral of cronometro_top is

-- DECLARAR LAS SIGNAL
signal alarma_signal : std_logic;
signal leds_signal : std_logic_vector (15 downto 0);
signal led_signal : std_logic_vector (6 downto 0);
signal an_signal : std_logic_vector(7 downto 0);

component crono
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   LED : out std_logic_vector(6 downto 0);
           dp : out  STD_LOGIC;
           alarma : out std_logic;
           sw_alarm_on : in std_logic;
		   an : out std_logic_vector(7 downto 0);
           ce : in  STD_LOGIC);
end component;

component alarm 
  Port ( clk : in std_logic;
         reset : in std_logic;
         ce_alarm : in std_logic;
         leds : out std_logic_vector(15 downto 0); -- Todos los LED Rojos de la Placa
         sw_alarm_reset : in std_logic;
         led1_rgb : out std_logic_vector(1 downto 0); --Bit 1 es el estado del red del RGB y el bit 0 es el green
         led2_rgb : out std_logic_vector(1 downto 0) --Bit 1 es el estado del red del RGB y el bit 0 es el green
   );
end component;



begin

    crono_inst : crono
    Port map( 
           clk => clk,
           reset => reset,
		   LED => LED,
           dp => dp,
		   an => an,
		   sw_alarm_on => sw_alarm_on,
		   alarma => alarma_signal,
           ce => ce     
    );     

    alarm_inst : alarm
    Port map( 
        clk => clk,
        sw_alarm_reset => sw_alarm_reset,
        reset => reset,   
        ce_alarm => alarma_signal,
        led1_rgb => led1_rgb,
        led2_rgb => led2_rgb, 
        leds => leds        
       );
end Behavioral;
