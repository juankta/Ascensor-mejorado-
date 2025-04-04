-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/31/2025 12:28:39"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controlador_vertical1 IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	piso_destino : IN std_logic_vector(2 DOWNTO 0);
	dir : IN std_logic;
	piso_actual : OUT std_logic_vector(2 DOWNTO 0);
	piso_7seg : OUT std_logic_vector(6 DOWNTO 0);
	llegada : OUT std_logic;
	dir_out : OUT std_logic
	);
END controlador_vertical1;

-- Design Ports Information
-- piso_actual[0]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_actual[1]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_actual[2]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[0]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[1]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[2]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[3]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[4]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[5]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_7seg[6]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- llegada	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dir_out	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dir	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_destino[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_destino[0]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piso_destino[2]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlador_vertical1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_piso_destino : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_dir : std_logic;
SIGNAL ww_piso_actual : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_piso_7seg : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_llegada : std_logic;
SIGNAL ww_dir_out : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \piso_actual[0]~output_o\ : std_logic;
SIGNAL \piso_actual[1]~output_o\ : std_logic;
SIGNAL \piso_actual[2]~output_o\ : std_logic;
SIGNAL \piso_7seg[0]~output_o\ : std_logic;
SIGNAL \piso_7seg[1]~output_o\ : std_logic;
SIGNAL \piso_7seg[2]~output_o\ : std_logic;
SIGNAL \piso_7seg[3]~output_o\ : std_logic;
SIGNAL \piso_7seg[4]~output_o\ : std_logic;
SIGNAL \piso_7seg[5]~output_o\ : std_logic;
SIGNAL \piso_7seg[6]~output_o\ : std_logic;
SIGNAL \llegada~output_o\ : std_logic;
SIGNAL \dir_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \dir~input_o\ : std_logic;
SIGNAL \piso_destino[1]~input_o\ : std_logic;
SIGNAL \piso_destino[0]~input_o\ : std_logic;
SIGNAL \piso_destino[2]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \piso_act_reg[1]~2_combout\ : std_logic;
SIGNAL \piso_act_reg[1]~3_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \piso_act_reg[2]~4_combout\ : std_logic;
SIGNAL \piso_act_reg[2]~5_combout\ : std_logic;
SIGNAL \piso_act_reg[0]~0_combout\ : std_logic;
SIGNAL \piso_act_reg[0]~1_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \llegada_reg~q\ : std_logic;
SIGNAL piso_act_reg : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_piso_destino <= piso_destino;
ww_dir <= dir;
piso_actual <= ww_piso_actual;
piso_7seg <= ww_piso_7seg;
llegada <= ww_llegada;
dir_out <= ww_dir_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux6~0_combout\ <= NOT \Mux6~0_combout\;

-- Location: IOOBUF_X0_Y4_N23
\piso_actual[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => piso_act_reg(0),
	devoe => ww_devoe,
	o => \piso_actual[0]~output_o\);

-- Location: IOOBUF_X0_Y2_N23
\piso_actual[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => piso_act_reg(1),
	devoe => ww_devoe,
	o => \piso_actual[1]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\piso_actual[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => piso_act_reg(2),
	devoe => ww_devoe,
	o => \piso_actual[2]~output_o\);

-- Location: IOOBUF_X0_Y2_N16
\piso_7seg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[0]~output_o\);

-- Location: IOOBUF_X1_Y0_N30
\piso_7seg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => piso_act_reg(2),
	devoe => ww_devoe,
	o => \piso_7seg[1]~output_o\);

-- Location: IOOBUF_X0_Y5_N9
\piso_7seg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[2]~output_o\);

-- Location: IOOBUF_X0_Y2_N2
\piso_7seg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[3]~output_o\);

-- Location: IOOBUF_X0_Y5_N2
\piso_7seg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[4]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\piso_7seg[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[5]~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\piso_7seg[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \piso_7seg[6]~output_o\);

-- Location: IOOBUF_X0_Y3_N9
\llegada~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \llegada_reg~q\,
	devoe => ww_devoe,
	o => \llegada~output_o\);

-- Location: IOOBUF_X32_Y0_N30
\dir_out~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \dir_out~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y5_N15
\dir~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dir,
	o => \dir~input_o\);

-- Location: IOIBUF_X0_Y4_N15
\piso_destino[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piso_destino(1),
	o => \piso_destino[1]~input_o\);

-- Location: IOIBUF_X0_Y3_N1
\piso_destino[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piso_destino(0),
	o => \piso_destino[0]~input_o\);

-- Location: IOIBUF_X0_Y5_N22
\piso_destino[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piso_destino(2),
	o => \piso_destino[2]~input_o\);

-- Location: LCCOMB_X1_Y4_N28
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Equal0~0_combout\ & (\piso_destino[2]~input_o\ $ (!piso_act_reg(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \piso_destino[2]~input_o\,
	datac => piso_act_reg(2),
	datad => \Equal0~0_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X1_Y4_N18
\piso_act_reg[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[1]~2_combout\ = (\Equal0~1_combout\ & ((!piso_act_reg(0)))) # (!\Equal0~1_combout\ & (\dir~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dir~input_o\,
	datac => piso_act_reg(0),
	datad => \Equal0~1_combout\,
	combout => \piso_act_reg[1]~2_combout\);

-- Location: LCCOMB_X1_Y4_N30
\piso_act_reg[1]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[1]~3_combout\ = (piso_act_reg(0) & (piso_act_reg(1) $ (((!piso_act_reg(2) & \piso_act_reg[1]~2_combout\))))) # (!piso_act_reg(0) & ((piso_act_reg(1) & ((\piso_act_reg[1]~2_combout\))) # (!piso_act_reg(1) & (piso_act_reg(2) & 
-- !\piso_act_reg[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => piso_act_reg(0),
	datab => piso_act_reg(2),
	datac => piso_act_reg(1),
	datad => \piso_act_reg[1]~2_combout\,
	combout => \piso_act_reg[1]~3_combout\);

-- Location: IOIBUF_X0_Y14_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G2
\reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X1_Y4_N31
\piso_act_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \piso_act_reg[1]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => piso_act_reg(1));

-- Location: LCCOMB_X1_Y4_N16
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\piso_destino[1]~input_o\ & (piso_act_reg(1) & (\piso_destino[0]~input_o\ $ (!piso_act_reg(0))))) # (!\piso_destino[1]~input_o\ & (!piso_act_reg(1) & (\piso_destino[0]~input_o\ $ (!piso_act_reg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piso_destino[1]~input_o\,
	datab => \piso_destino[0]~input_o\,
	datac => piso_act_reg(1),
	datad => piso_act_reg(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y4_N24
\piso_act_reg[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[2]~4_combout\ = (\dir~input_o\ & ((piso_act_reg(2)) # ((piso_act_reg(0) & piso_act_reg(1))))) # (!\dir~input_o\ & (piso_act_reg(2) & ((piso_act_reg(0)) # (piso_act_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dir~input_o\,
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \piso_act_reg[2]~4_combout\);

-- Location: LCCOMB_X1_Y4_N8
\piso_act_reg[2]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[2]~5_combout\ = (\Equal0~0_combout\ & ((\piso_destino[2]~input_o\ & ((piso_act_reg(2)) # (\piso_act_reg[2]~4_combout\))) # (!\piso_destino[2]~input_o\ & (piso_act_reg(2) & \piso_act_reg[2]~4_combout\)))) # (!\Equal0~0_combout\ & 
-- (((\piso_act_reg[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \piso_destino[2]~input_o\,
	datac => piso_act_reg(2),
	datad => \piso_act_reg[2]~4_combout\,
	combout => \piso_act_reg[2]~5_combout\);

-- Location: FF_X1_Y4_N9
\piso_act_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \piso_act_reg[2]~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => piso_act_reg(2));

-- Location: LCCOMB_X1_Y4_N22
\piso_act_reg[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[0]~0_combout\ = (\dir~input_o\ & (piso_act_reg(2) $ ((!piso_act_reg(0))))) # (!\dir~input_o\ & (!piso_act_reg(0) & ((piso_act_reg(2)) # (piso_act_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dir~input_o\,
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \piso_act_reg[0]~0_combout\);

-- Location: LCCOMB_X1_Y4_N0
\piso_act_reg[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \piso_act_reg[0]~1_combout\ = (\Equal0~1_combout\ & ((piso_act_reg(0)))) # (!\Equal0~1_combout\ & (\piso_act_reg[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piso_act_reg[0]~0_combout\,
	datac => piso_act_reg(0),
	datad => \Equal0~1_combout\,
	combout => \piso_act_reg[0]~1_combout\);

-- Location: FF_X1_Y4_N1
\piso_act_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \piso_act_reg[0]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => piso_act_reg(0));

-- Location: LCCOMB_X1_Y4_N26
\Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (piso_act_reg(2) & (!piso_act_reg(0) & !piso_act_reg(1))) # (!piso_act_reg(2) & (piso_act_reg(0) $ (piso_act_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X1_Y4_N12
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (piso_act_reg(1) & (piso_act_reg(2))) # (!piso_act_reg(1) & ((piso_act_reg(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X1_Y4_N10
\Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!piso_act_reg(2) & (piso_act_reg(0) & !piso_act_reg(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X1_Y4_N20
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (piso_act_reg(2) & ((piso_act_reg(0)) # (piso_act_reg(1)))) # (!piso_act_reg(2) & ((!piso_act_reg(1)) # (!piso_act_reg(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X1_Y4_N14
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = piso_act_reg(2) $ (((piso_act_reg(0)) # (piso_act_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => piso_act_reg(2),
	datac => piso_act_reg(0),
	datad => piso_act_reg(1),
	combout => \Mux0~0_combout\);

-- Location: FF_X1_Y4_N29
llegada_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Equal0~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \llegada_reg~q\);

ww_piso_actual(0) <= \piso_actual[0]~output_o\;

ww_piso_actual(1) <= \piso_actual[1]~output_o\;

ww_piso_actual(2) <= \piso_actual[2]~output_o\;

ww_piso_7seg(0) <= \piso_7seg[0]~output_o\;

ww_piso_7seg(1) <= \piso_7seg[1]~output_o\;

ww_piso_7seg(2) <= \piso_7seg[2]~output_o\;

ww_piso_7seg(3) <= \piso_7seg[3]~output_o\;

ww_piso_7seg(4) <= \piso_7seg[4]~output_o\;

ww_piso_7seg(5) <= \piso_7seg[5]~output_o\;

ww_piso_7seg(6) <= \piso_7seg[6]~output_o\;

ww_llegada <= \llegada~output_o\;

ww_dir_out <= \dir_out~output_o\;
END structure;


