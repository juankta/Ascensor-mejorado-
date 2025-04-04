library verilog;
use verilog.vl_types.all;
entity controlador_vertical1_vlg_check_tst is
    port(
        dir_out         : in     vl_logic;
        llegada         : in     vl_logic;
        piso_7seg       : in     vl_logic_vector(6 downto 0);
        piso_actual     : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end controlador_vertical1_vlg_check_tst;
