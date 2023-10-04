# 100MHz system clock
set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports {sysclk}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {sysclk_IBUF}]
create_clock -period 10.000 -name CLK -waveform {0.000 5.000} [get_ports {sysclk}]

# Switch
set_property -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS33} [get_ports {reset}]

# Seven-segment display
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports {ssd[6]}]
set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports {ssd[5]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {ssd[4]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {ssd[3]}]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {ssd[2]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {ssd[1]}]
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {ssd[0]}]

set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {ssd[7]}]

# Seven-segment display BIT
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {ssd[8]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {ssd[9]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {ssd[10]}]
set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports {ssd[11]}]

set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {ssd[12]}]




