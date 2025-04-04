library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_luces is
    Port (
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        personas_dentro  : in  STD_LOGIC;
        personas_mas     : in  STD_LOGIC;
        puerta_abierta   : in  STD_LOGIC;
        puerta_cerrada   : in  STD_LOGIC;
        ascensor_activo  : in  STD_LOGIC; 
        luz_de_cerrado_abierto : out STD_LOGIC;
        luz_principal    : out STD_LOGIC;
        luz_advertencia  : out STD_LOGIC
    );
end control_luces;

architecture arch_luces of control_luces is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            luz_principal   <= '0';
            luz_advertencia <= '0';
            luz_de_cerrado_abierto <= '0';
        elsif rising_edge(clk) then
     
            if personas_dentro = '1' or ascensor_activo = '1' then
                luz_principal <= '1';
            else
                luz_principal <= '0';
            end if;

        
            if personas_mas = '1' then
                luz_advertencia <= '1';
            else
                luz_advertencia <= '0';
            end if;

            
            if puerta_abierta = '1' or puerta_cerrada = '1' then
                luz_de_cerrado_abierto <= '1';
            else
                luz_de_cerrado_abierto <= '0';
            end if;
        end if;
    end process;
end arch_luces;
