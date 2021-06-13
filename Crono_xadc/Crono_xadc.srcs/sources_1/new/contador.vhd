library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity contador is
	 Generic (module : integer := 10;
				 width : integer := 4);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (width-1 downto 0);
           ce : in  STD_LOGIC;
           top : out  STD_LOGIC);
end contador;

architecture Behavioral of contador is

signal q : std_logic_vector(width-1 downto 0);

begin


process (clk, reset) 
begin
   if reset='1' then 
      q <= (others => '0');
   elsif clk='1' and clk'event then
      if ce='1' then
			if q = module-1 then
				q <= (others => '0');

			else
				q <= q + 1;
			end if;
      end if;
   end if;
end process;

process(q)
begin
	if q = module-1 then
		top <= '1';
	else
		top <= '0';
	end if;
end process;

count <= q;

end Behavioral;

