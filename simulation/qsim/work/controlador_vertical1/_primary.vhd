library verilog;
use verilog.vl_types.all;
entity controlador_vertical1 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        piso_destino    : in     vl_logic_vector(2 downto 0);
        dir             : in     vl_logic;
        piso_actual     : out    vl_logic_vector(2 downto 0);
        piso_7seg       : out    vl_logic_vector(6 downto 0);
        llegada         : out    vl_logic;
        dir_out         : out    vl_logic
    );
end controlador_vertical1;
