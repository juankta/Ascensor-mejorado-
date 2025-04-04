library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controlador_vertical1 is
    Port (
        clk           : in  STD_LOGIC;
        reset         : in  STD_LOGIC;
        piso_destino  : in  STD_LOGIC_VECTOR(4 downto 0);
        hall_call_up   : in  STD_LOGIC_VECTOR(4 downto 0);
        hall_call_down : in  STD_LOGIC_VECTOR(4 downto 0);
        piso_actual   : out STD_LOGIC_VECTOR(2 downto 0);
        piso_7seg     : out STD_LOGIC_VECTOR(6 downto 0);
        llegada       : out STD_LOGIC
    );
end controlador_vertical1;

architecture controladorvertical_arch of controlador_vertical1 is
    signal piso_act_reg : integer range 0 to 4 := 1;  -- Piso actual (0 = piso 1, 4 = piso 5)
    signal destino_int  : integer range 0 to 4 := 1;  -- Piso destino calculado
    signal llegada_reg  : STD_LOGIC := '0';
    signal contador     : integer range 0 to 49999999 := 0;
    signal enable       : STD_LOGIC := '0';
    
    -- Función para decodificar el piso a 7 segmentos (adaptado a 0 a 4)
    function decode_7seg(digit: unsigned(2 downto 0)) return std_logic_vector is
    begin
       case digit is
         when "000" => return "1111001"; -- 0 (puede interpretarse como piso 1)
         when "001" => return "0100100"; -- 1 (piso 2)
         when "010" => return "0110000"; -- 2 (piso 3)
         when "011" => return "0011001"; -- 3 (piso 4)
         when "100" => return "0010010"; -- 4 (piso 5)
         when others => return "1111111"; -- Error
       end case;
    end function;
    
begin
    process(clk, reset)
        -- Variables locales para evaluar las solicitudes
        variable ext_min_diff  : integer := 100;
        variable int_min_diff  : integer := 100;
        variable temp_diff     : integer;
        variable ext_target    : integer := piso_act_reg;
        variable int_target    : integer := piso_act_reg;
    begin
        if reset = '1' then
            piso_act_reg <= 0;
            destino_int  <= 0;
            llegada_reg  <= '0';
            contador     <= 0;
            enable       <= '0';
        elsif rising_edge(clk) then
            -- Contador para simular el retardo de movimiento (50M ciclos)
            if contador = 49999999 then
                contador <= 0;
                enable   <= '1';
            else
                contador <= contador + 1;
                enable   <= '0';
            end if;
            
            if enable = '1' then
                -- Primero se evalúan las solicitudes externas (botones de hall)
                ext_min_diff := 100;
                ext_target   := piso_act_reg;
                for i in 0 to 4 loop
                    -- Para hall_call_up: se ignora piso 5 (índice 4)
                    if (i < 4) and (hall_call_up(i) = '1') then
                        temp_diff := abs(i - piso_act_reg);
                        if temp_diff < ext_min_diff then
                            ext_min_diff := temp_diff;
                            ext_target   := i;
                        end if;
                    end if;
                    -- Para hall_call_down: se ignora piso 1 (índice 0)
                    if (i > 0) and (hall_call_down(i) = '1') then
                        temp_diff := abs(i - piso_act_reg);
                        if temp_diff < ext_min_diff then
                            ext_min_diff := temp_diff;
                            ext_target   := i;
                        end if;
                    end if;
                end loop;
                
                if ext_min_diff < 100 then
                    -- Si existe al menos una solicitud externa, se le da prioridad
                    destino_int <= ext_target;
                else
                    -- No hay solicitudes externas; se evalúa la solicitud interna (piso_destino)
                    int_min_diff := 100;
                    int_target   := piso_act_reg;
                    for i in 0 to 4 loop
                        if piso_destino(i) = '1' then
                            temp_diff := abs(i - piso_act_reg);
                            if temp_diff < int_min_diff then
                                int_min_diff := temp_diff;
                                int_target   := i;
                            end if;
                        end if;
                    end loop;
                    destino_int <= int_target;
                end if;
                
                -- Movimiento del ascensor hacia el piso destino (destino_int)
                if piso_act_reg = destino_int then
                    llegada_reg <= '1';  -- Se activa la señal de llegada al piso destino
                else
                    llegada_reg <= '0';
                    if piso_act_reg < destino_int then
                        piso_act_reg <= piso_act_reg + 1;
                    elsif piso_act_reg > destino_int then
                        piso_act_reg <= piso_act_reg - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    -- Asignación de salidas
    piso_actual <= std_logic_vector(to_unsigned(piso_act_reg, 3));
    piso_7seg   <= decode_7seg(to_unsigned(piso_act_reg, 3));
    llegada     <= llegada_reg;
    
end controladorvertical_arch;
