library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_puertas is
    Port (
        clk                   : in STD_LOGIC;
        reset                 : in STD_LOGIC;
        habilitar_ascensor    : in STD_LOGIC;
        llegada_piso          : in STD_LOGIC;
        boton_abrir           : in STD_LOGIC;
        boton_cerrar          : in STD_LOGIC;
        boton_cerrado_urgente : in STD_LOGIC;
        puerta_abierta        : out STD_LOGIC;
        puerta_cerrada        : out STD_LOGIC;
        alarma_puerta         : out STD_LOGIC
    );
end control_puertas;

architecture Behavioral of control_puertas is
    signal contador     : INTEGER := 0;
    signal puerta_estado: STD_LOGIC := '0'; -- 0: Cerrada, 1: Abierta
    signal clk_div      : STD_LOGIC := '0';
    signal count_div    : INTEGER := 0;
    
    constant DIVISOR : INTEGER := 50000000; -- Para dividir de 50 MHz a 1 Hz
begin
    
    -- Proceso para dividir la frecuencia de reloj
    process(clk)
    begin
        if rising_edge(clk) then
            if count_div = (DIVISOR / 2) - 1 then
                clk_div <= not clk_div;
                count_div <= 0;
            else
                count_div <= count_div + 1;
            end if;
        end if;
    end process;
    
    -- Proceso de control de la puerta con espera antes de cambiar estado
    process(clk_div)
    begin
        if rising_edge(clk_div) then
            if reset = '1' then
                puerta_estado <= '0';
                contador <= 0;
                alarma_puerta <= '1';
            elsif habilitar_ascensor = '0' then
                puerta_estado <= '0';
                contador <= 0;
                alarma_puerta <= '1';
            else
                alarma_puerta <= '0';
                
                if contador > 0 then
                    contador <= contador - 1;
                end if;
                
                -- Abrir la puerta después de llegar al piso y presionar abrir
                if llegada_piso = '1' and boton_abrir = '1' and puerta_estado = '0' and contador = 0 then
                    contador <= 10; -- Espera 10s antes de abrir
                elsif contador = 1 and puerta_estado = '0' then
                    puerta_estado <= '1';
                end if;
                
                -- Cerrar la puerta normalmente
                if llegada_piso = '1' and boton_cerrar = '1' and puerta_estado = '1' and contador = 0 then
                    contador <= 45; -- Espera 45s antes de cerrar
                elsif contador = 1 and puerta_estado = '1' then
                    puerta_estado <= '0';
                end if;
                
                -- Cierre de emergencia
                if llegada_piso = '1' and boton_cerrado_urgente = '1' and puerta_estado = '1' and contador = 0 then
                    contador <= 5; -- Espera 5s antes de cerrar
                elsif contador = 1 and puerta_estado = '1' then
                    puerta_estado <= '0';
                end if;
            end if;
        end if;
    end process;
    
    -- Asignación de salidas
    puerta_abierta <= puerta_estado;
    puerta_cerrada <= not puerta_estado;
    
end Behavioral;

         