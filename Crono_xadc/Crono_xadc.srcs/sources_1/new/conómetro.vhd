
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity crono_digital is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   led : out std_logic_vector(6 downto 0);
           dp : out  STD_LOGIC;
		   an : out std_logic_vector(7 downto 0);
		   alarma : out std_logic;
		   sw_3 : in std_logic;
           ce : in  STD_LOGIC       
           );          
end crono_digital;

architecture Behavioral of crono_digital is

signal ce_centesimas, ce_decimas, ce_useg, ce_dseg, ce_minutos, ce_dminutos, ce_horas, ce_dhoras, ce_top, alm, ce_alm: std_logic;
signal top_divisor, top_centesimas, top_decimas, top_useg, top_dseg, top_minutos ,top_dminutos, top_horas, top_dhoras, top_disp: std_logic;
signal hex, centesimas, decimas, useg, dseg, minutos, dminutos, horas, dhoras: std_logic_vector(3 downto 0);
signal divisor : std_logic_vector(19 downto 0);
signal sel : std_logic_vector(2 downto 0);
signal reset_int : std_logic;
signal sel_dig : std_logic_vector (1 downto 0);
signal cuenta : STD_LOGIC_VECTOR (3 downto 0); 
signal valor : STD_LOGIC_VECTOR (15 downto 0); 

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
	ce_centesimas <= top_divisor and ce and ce_alm;
	sel <= divisor(18 downto 16); -- señal de refresco 100MHz/2^16

	centesimas_unit: contador 
	generic map(
		module => 10,
		width => 4)
	PORT MAP(
		clk => clk,
		reset => reset_int,
		count => centesimas,
		ce => ce_centesimas,
		top => top_centesimas
	);
	ce_decimas <= top_centesimas and top_divisor and ce;
	
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
	ce_useg <= top_decimas and top_divisor and top_centesimas and ce;

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
--Creamos la puerta OR

	ce_top <= top_dhoras and top_horas and top_dminutos and top_minutos and top_dseg and top_useg and top_decimas and top_centesimas and top_divisor and ce;
	
	reset_int <= reset or ce_top;
	

--Representacion en displays

disp_cont: contador 
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


	with cuenta select
        HEX <=  centesimas		when "0001",
                decimas     	when "0010",
                useg       		when "0011",
                dseg           	when "0100",
                minutos        	when "0101",
                dminutos		when "0110",
                horas          	when "0111",
                dhoras         	when "1000",
                "0000"          when others;



  with HEX SELect
       LED<= "1111001" when "0001",   --1
             "0100100" when "0010",   --2
             "0110000" when "0011",   --3
             "0011001" when "0100",   --4
             "0010010" when "0101",   --5
             "0000010" when "0110",   --6
             "1111000" when "0111",   --7
             "0000000" when "1000",   --8
             "0010000" when "1001",   --9
             "1000000" when others;   --0
                
     
  with cuenta SELect
   an<=  "11111110" when "0001",   --1
         "11111101" when "0010",   --2
         "11111011" when "0011",   --3
         "11110111" when "0100",   --4
         "11101111" when "0101",   --5         
         "11011111" when "0110",   --6
         "10111111" when "0111",   --7
         "01111111" when "1000",   --8                    
         "--------" when others;   --0 


with cuenta select
		dp    <=	'1' when "0001",
					'1' when "0010",
					'0' when "0011",
					'1' when "0100",
					'0' when "0101",
					'1' when "0110",
					'0' when "0111",
					'1' when "1000",
					'1' when others;
					
--Activación de alarma

valor <= dminutos & minutos & dseg & useg;
			
process(valor, reset, sw_3)    
    begin
        if sw_3 = '1' and (valor = "0000000000010000") then
                alm <= '1';
                ce_alm <= '0';            
        else
                alm <= '0';
                ce_alm <= '1';           
        end if;
        if (reset='1') then 
            alm <= '0';
        end if;
end process;




--process (sw_3, reset)
--    begin
--        if sw_3 = '1' then
--            ce_alm <= '1';            
--        else
--            ce_alm <= '0';
--        end if;
--end process;

alarma <= alm;
--alarma <= alm and ce_alm;

         
end Behavioral;