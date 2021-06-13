library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity crono is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   LED : out std_logic_vector(6 downto 0);
           dp : out  STD_LOGIC;
           alarma : out std_logic;
           sw_alarm_on : in std_logic;
		   an : out std_logic_vector(7 downto 0);
           ce : in  STD_LOGIC;
           time_out : in std_logic_vector (7 downto 0) -- Tiempo de la alarma (8 bits: 4 bits para unidades de segundo y 4 bits para decenas segundo)
           );
end crono;

architecture Behavioral of crono is

signal ce_centesimas, ce_decimas, ce_useg, ce_dseg, ce_minutos, ce_dminutos, ce_horas, ce_dhoras, ce_top, alarm, ce_alarm : std_logic;
signal top_divisor, top_centesimas, top_decimas, top_useg, top_dseg, top_minutos, top_dminutos, top_horas, top_dhoras, top_disp : std_logic;
signal hex, centesimas, decimas, useg, dseg, minutos, dminutos, horas, dhoras  : std_logic_vector(3 downto 0);
signal divisor : std_logic_vector(19 downto 0);
signal sel : std_logic_vector(2 downto 0);
signal reset_int : std_logic; 
signal cuenta : std_logic_vector (3 downto 0); 
signal value : std_logic_vector (15 downto 0); 



	COMPONENT contador
	 Generic (
		module : integer;
		width : integer);
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;          
		count : OUT std_logic_vector(width-1 downto 0);
		top : OUT std_logic
		);
	END COMPONENT;

begin

	divisorfrec_unit: contador 
	generic map(
		module => 1000000,
		width => 20)
	PORT MAP(
		clk => clk,
		reset => '0',
		count => divisor,
		ce => '1',
		top => top_divisor
	);
	ce_centesimas <= top_divisor and ce and ce_alarm;
	sel <= divisor(18 downto 16); -- se�al de refresco 100MHz/2^16

	centesimas_unit: contador 
	generic map(
		module => 10,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset,
		count => centesimas,
		ce => ce_centesimas,
		top => top_centesimas
	);
	ce_decimas <= top_centesimas and top_divisor and ce; --Se pone decimas a 1 cuanto centesimas y divisor llegan a los topes
	
    decimas_unit: contador 
	generic map(
		module => 10,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => decimas,
		ce => ce_decimas,
		top => top_decimas
	);
	ce_useg <= top_decimas and top_centesimas and top_divisor and ce; --Se pone useg a 1 cuando ha llegado al top de decimas, centimas y divisor
	
	segundos_unit: contador 
	generic map(
		module => 10,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => useg,
		ce => ce_useg,
		top => top_useg
	);
	ce_dseg <= top_useg and top_decimas and top_centesimas and top_divisor and ce;

	dseg_unit: contador 
	generic map(
		module => 6,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => dseg,
		ce => ce_dseg,
		top => top_dseg
	);
	ce_minutos <= top_dseg and top_divisor and top_decimas and top_centesimas and top_useg and ce;

    minutos_unit: contador 
	generic map(
		module => 10,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => minutos,
		ce => ce_minutos,
		top => top_minutos
	);
	ce_dminutos <= top_divisor and top_decimas and top_centesimas and top_useg and top_dseg and top_minutos and ce;

	dminutos_unit: contador 
	generic map(
		module => 6,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => dminutos,
		ce => ce_dminutos,
		top => top_dminutos
	);
	ce_horas <= top_dminutos and top_minutos and top_dseg and top_useg and top_decimas and top_centesimas and top_divisor and ce;


	horas_unit: contador 
	generic map(
		module => 4,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => horas,
		ce => ce_horas,
		top => top_horas
	);
	ce_dhoras <= top_horas and top_dminutos and top_minutos and top_dseg and top_useg and top_decimas and top_centesimas and top_divisor and ce;
	
	dhoras_unit: contador 
	generic map(
		module => 3,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => dhoras,
		ce => ce_dhoras,
		top => top_dhoras
	);

-- Puerta OR
    -- Se pone a 1 el mayor de las cuentas cuando s ehan llegado a todos los tops, es decir a 23:59:59:99
	ce_top <= top_dhoras and top_horas and top_dminutos and top_minutos and top_dseg and top_useg and top_decimas and top_centesimas and top_divisor and ce;
	--Se resetea al llegar al tope o bien con un reset
	reset_int <= reset or ce_top;
	

-- Display
-- Se hace yna cuenta para ir variando el digito del display a modificar segun valor de cuenta
display_count : contador
	generic map(
		module => 9,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => cuenta,
		ce => ce_centesimas,
		top => top_disp
);
          
-- 
-- segment encoinputg
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
   
-- Se representa el digito
 with HEX Select
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
 
 -- Se carga el valor del digito en HEX
with cuenta select 
    HEX <= centesimas   when "0001",
           decimas      when "0010", 
           useg         when "0011",
           dseg         when "0100",   
           minutos      when "0101",
           dminutos     when "0110",    
           horas        when "0111",
           dhoras       when "1000",  
           "0000"       when others;   
 
-- Con cuenta se elige el display a cambiar
 with cuenta select
   an <="11111110" when "0001",   --1
        "11111101" when "0010",   --2
        "11111011" when "0011",   --3
        "11110111" when "0100",   --4
        "11101111" when "0101",   --5         
        "11011111" when "0110",   --6
        "10111111" when "0111",   --7
        "01111111" when "1000",   --8                    
        "--------" when others;   --0 
 
-- Se elige si se activa o no el punto decimal
with cuenta select
    dp <= '1' when "0001",
          '1' when "0010",
          '0' when "0011",
          '1' when "0100",
          '0' when "0101",
          '1' when "0110",
          '0' when "0111",
          '1' when "1000",
          '1' when others;

-- Alarma

value <= dminutos & minutos & dseg &useg ; --Se concatenan los valores del cornometro para la alarma

process (value, sw_alarm_on, reset, time_out)
    begin
        if sw_alarm_on = '1' and value = ("00000000" & time_out) then
            alarm <= '1';
            ce_alarm <= '0';
        else
            alarm <= '0';
            ce_alarm <= '1';
        end if;
        if (reset = '1') then
            alarm <= '0';
        end if;
end process;

alarma <= alarm;

end Behavioral;
