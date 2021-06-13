----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2020 17:23:51
-- Design Name: 
-- Module Name: top_level - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           OT, EOC, EOS : out STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           CHANNEL : out STD_LOGIC_VECTOR (4 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (6 downto 0);
           alarm : out STD_LOGIC_VECTOR (7 downto 0));
end top_level;

architecture Behavioral of top_level is

    component ug480
        port (DCLK             : in std_logic;
              RESET            : in std_logic;
              VAUXP            : in std_logic_vector (3 downto 0);
              VAUXN            : in std_logic_vector (3 downto 0);
              VP               : in std_logic;
              VN               : in std_logic;
              MEASURED_TEMP    : out std_logic_vector (15 downto 0);
              MEASURED_VCCAUX  : out std_logic_vector (15 downto 0);
              MEASURED_VCCINT  : out std_logic_vector (15 downto 0);
              MEASURED_VCCBRAM : out std_logic_vector (15 downto 0);
              MEASURED_AUX0    : out std_logic_vector (15 downto 0);
              MEASURED_AUX1    : out std_logic_vector (15 downto 0);
              MEASURED_AUX2    : out std_logic_vector (15 downto 0);
              MEASURED_AUX3    : out std_logic_vector (15 downto 0);
              ALM              : out std_logic_vector (7 downto 0);
              CHANNEL          : out std_logic_vector (4 downto 0);
              OT               : out std_logic;
              EOC              : out std_logic;
              EOS              : out std_logic);
    end component;

    signal VAUXP            : std_logic_vector (3 downto 0) := (others =>'1');
    signal VAUXN            : std_logic_vector (3 downto 0) := (others =>'0');
    signal VP               : std_logic :='0';
    signal VN               : std_logic :='0';

    signal MEASURED_TEMP      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCAUX    : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCINT    : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_VCCBRAM   : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX0      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX1      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX2      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    signal MEASURED_AUX3      : STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port

    signal count      : STD_LOGIC_VECTOR (19 downto 0); 
    signal led_int      : STD_LOGIC_VECTOR (15 downto 0); 
    signal led_int2      : STD_LOGIC_VECTOR (3 downto 0); 
    signal sel_dig      : STD_LOGIC_VECTOR (1 downto 0); 

begin

    dut : ug480
    port map (DCLK             => clk,
              RESET            => reset,
              VAUXP            => VAUXP,
              VAUXN            => VAUXN,
              VP               => VP,
              VN               => VN,
              MEASURED_TEMP    => MEASURED_TEMP,
              MEASURED_VCCAUX  => MEASURED_VCCAUX,
              MEASURED_VCCINT  => MEASURED_VCCINT,
              MEASURED_VCCBRAM => MEASURED_VCCBRAM,
              MEASURED_AUX0    => MEASURED_AUX0,
              MEASURED_AUX1    => MEASURED_AUX1,
              MEASURED_AUX2    => MEASURED_AUX2,
              MEASURED_AUX3    => MEASURED_AUX3,
              ALM              => alarm,
              CHANNEL          => CHANNEL,
              OT               => OT,
              EOC              => EOC,
              EOS              => EOS);

--selecci�n de par�metro a representar
process (sel,MEASURED_TEMP,MEASURED_VCCAUX,MEASURED_VCCINT,MEASURED_VCCBRAM,
         MEASURED_AUX0,MEASURED_AUX1,MEASURED_AUX2,MEASURED_AUX3)
begin
   case sel is
      when "000" => led_int <= MEASURED_VCCAUX;
      when "001" => led_int <= MEASURED_VCCINT;
      when "010" => led_int <= MEASURED_VCCBRAM;
      when "011" => led_int <= MEASURED_AUX0;
      when "100" => led_int <= MEASURED_AUX1;
      when "101" => led_int <= MEASURED_AUX2;
      when "110" => led_int <= MEASURED_AUX3;
      when others => led_int <= MEASURED_TEMP;
   end case;
end process;

--representaci�n en displays

process (clk)
begin
   if clk='1' and clk'event then
      if reset='1' then
         count <= (others => '0');
      else
         count <= count + 1;
      end if;
   end if;
end process;

sel_dig <= count(17 downto 16); -- se�al de refresco 100MHz/2^16


process (sel_dig,led_int)
begin
   case sel_dig is
      when "00" => led_int2 <= led_int(3 downto 0);
      when "01" => led_int2 <= led_int(7 downto 4);
      when "10" => led_int2 <= led_int(11 downto 8);
      when others => led_int2 <= led_int(15 downto 12);
   end case;
end process;

    with sel_dig SELect
   an<=  "11111101" when "0001",   --1
         "11111011" when "0010",   --2
         "11110111" when "0011",   --3
         "11111110" when others;   --0

    with led_int2 SELect
   LED<= "1111001" when "0001",   --1
         "0100100" when "0010",   --2
         "0110000" when "0011",   --3
         "0011001" when "0100",   --4
         "0010010" when "0101",   --5
         "0000010" when "0110",   --6
         "1111000" when "0111",   --7
         "0000000" when "1000",   --8
         "0010000" when "1001",   --9
         "0001000" when "1010",   --A
         "0000011" when "1011",   --b
         "1000110" when "1100",   --C
         "0100001" when "1101",   --d
         "0000110" when "1110",   --E
         "0001110" when "1111",   --F
         "1000000" when others;   --0
         
end Behavioral;