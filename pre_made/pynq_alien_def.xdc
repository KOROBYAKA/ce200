## Clock signal 50 MHz (period in nanosec-- 8->125Mhz, 10->100Mhz 20->50Mhz)
## waveform: aseta kellon reunat {nouseva laskeva}, jos ei asetettu, menee puoliväliin, niinkuin tässäkin
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS18} [get_ports clk]
create_clock -period 20.000 -name clk_pin -waveform {0.000 10.000} -add [get_ports clk]

set_property PACKAGE_PIN D19 [get_ports {btn[0]}]
set_property PACKAGE_PIN D20 [get_ports {btn[1]}]
set_property PACKAGE_PIN L20 [get_ports {btn[2]}]
set_property PACKAGE_PIN L19 [get_ports {btn[3]}]
set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property PACKAGE_PIN M14 [get_ports {led[3]}]
set_property PACKAGE_PIN M19 [get_ports rst_n]
set_property PACKAGE_PIN V17 [get_ports {channel[0]}]
set_property PACKAGE_PIN V18 [get_ports {channel[1]}]
set_property PACKAGE_PIN T16 [get_ports {channel[2]}]
set_property PACKAGE_PIN R17 [get_ports {channel[3]}]
set_property PACKAGE_PIN P18 [get_ports {channel[4]}]
set_property PACKAGE_PIN N17 [get_ports {channel[5]}]
set_property PACKAGE_PIN V13 [get_ports {channel[6]}]
set_property PACKAGE_PIN V15 [get_ports {channel[7]}]
set_property PACKAGE_PIN U17 [get_ports s_sda]
set_property PACKAGE_PIN R16 [get_ports s_clk]
set_property PACKAGE_PIN W11 [get_ports s_rst]
set_property PACKAGE_PIN Y12 [get_ports lat]
set_property PACKAGE_PIN Y11 [get_ports sb]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports s_sda]
set_property IOSTANDARD LVCMOS18 [get_ports s_clk]
set_property IOSTANDARD LVCMOS18 [get_ports s_rst]
set_property IOSTANDARD LVCMOS18 [get_ports lat]
set_property IOSTANDARD LVCMOS18 [get_ports sb]







set_property IOSTANDARD LVCMOS18 [get_ports sw0]
set_property PACKAGE_PIN M20 [get_ports sw0]




create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {alien_x[0]} {alien_x[1]} {alien_x[2]} {alien_x[3]} {alien_x[4]} {alien_x[5]} {alien_x[6]} {alien_x[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list enable]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
