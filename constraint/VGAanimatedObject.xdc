## Clock signal
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {switch}]

##Buttons
## rst:
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports rst]
## down:
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports {push[0]}]
## right:
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports {push[1]}]
## left
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports {push[2]}]
## up:
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports {push[3]}] 

##VGA Connector
set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports {rgb[2]}]
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports {rgb[1]}]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports {rgb[0]}]
set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports hsync]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports vsync]