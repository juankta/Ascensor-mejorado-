library verilog;
use verilog.vl_types.all;
entity controlador_vertical1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        dir             : in     vl_logic;
        piso_destino    : in     vl_logic_vector(2 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end controlador_vertical1_vlg_sample_tst;
