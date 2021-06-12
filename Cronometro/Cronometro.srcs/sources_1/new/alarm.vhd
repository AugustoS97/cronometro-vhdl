----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2021 20:54:15
-- Design Name: 
-- Module Name: alarm - Behavioral
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

entity alarm is
  Port ( clk : in std_logic;
         reset : in std_logic;
         ce_alarm : in std_logic;
         leds : out std_logic_vector(15 downto 0); -- Todos los LED Rojos de la Placa
         sw_alarm_reset : in std_logic;
         led1_rgb : out std_logic_vector(1 downto 0); --Bit 1 es el estado del red del RGB y el bit 0 es el green
         led2_rgb : out std_logic_vector(1 downto 0) --Bit 1 es el estado del red del RGB y el bit 0 es el green
   );
end alarm;

architecture Behavioral of alarm is

signal cuenta : integer range 0 to 100000000;
signal leds_signal : std_logic_vector(15 downto 0);

begin

leds <= leds_signal;

process (ce_alarm, reset, clk, sw_alarm_reset)

    begin
        if ce_alarm = '1' then
            if (reset ='1') or sw_alarm_reset = '1' then
                cuenta <= 0;
                leds_signal <= "0000000000000000";
                led1_rgb <= "01";
                led2_rgb <= "01";
            elsif (rising_edge(clk)) then
                led1_rgb <= "10";
                led2_rgb <= "10";
                if (cuenta = 100000000) then 
                    cuenta <= 0;
                    leds_signal <= not(leds_signal);
                else
                    cuenta <= cuenta +1;
                end if;
           end if;
           
         else
            leds_signal <= "0000000000000000";
            led1_rgb <= "01";
            led2_rgb <= "01";
         end if;
         
 end process;
end Behavioral;
