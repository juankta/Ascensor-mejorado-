library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sensor_personas is
    Port (
        clk               : in  STD_LOGIC;
        reset             : in  STD_LOGIC;
        boton_subir       : in  STD_LOGIC;
        boton_bajar       : in  STD_LOGIC;
        cantidad_personas : out INTEGER range 0 to 11;
        alarma_personas   : out STD_LOGIC
    );
end sensor_personas;

architecture arch_sensor_personas of sensor_personas is
    signal personas       : INTEGER range 0 to 11 := 0;
    signal boton_subir_ant : STD_LOGIC := '0';
    signal boton_bajar_ant : STD_LOGIC := '0';
    
    -- Señal de reloj reducido
    signal clk_div       : STD_LOGIC := '0';
    signal contador      : INTEGER range 0 to 24999999 := 0;
    
begin
    -- Proceso para dividir la frecuencia de 50 MHz a 1 Hz
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
            clk_div <= '0';
        elsif rising_edge(clk) then
            if contador = 24999999 then
                contador <= 0;
                clk_div <= not clk_div;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    -- Proceso principal con el reloj dividido
    process(clk_div, reset)
    begin
        if reset = '1' then
            personas <= 0;
        elsif rising_edge(clk_div) then
            -- Detectar flanco de subida en boton_subir
            if boton_subir = '1' and boton_subir_ant = '0' and personas < 11 then
                personas <= personas + 1;
            end if;

            -- Detectar flanco de bajada en boton_bajar
            if boton_bajar = '1' and boton_bajar_ant = '0' and personas > 0 then
                personas <= personas - 1;
            end if;

            -- Guardar el estado anterior de los botones
            boton_subir_ant <= boton_subir;
            boton_bajar_ant <= boton_bajar;
        end if;
    end process;

    cantidad_personas <= personas;
    alarma_personas <= '1' when personas > 10 else '0';

end arch_sensor_personas;