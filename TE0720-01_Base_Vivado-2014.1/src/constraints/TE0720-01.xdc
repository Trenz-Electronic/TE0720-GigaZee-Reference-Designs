# CPLD connections
set_property PACKAGE_PIN R15 [get_ports cpld_x0]
set_property PACKAGE_PIN L16 [get_ports cpld_x1]
set_property PACKAGE_PIN P22 [get_ports cpld_x5]
set_property PACKAGE_PIN N22 [get_ports cpld_x7]

#set_property PACKAGE_PIN M15 [get_ports cpld_xio4]
#set_property PACKAGE_PIN N15 [get_ports cpld_xio5]
#set_property PACKAGE_PIN P16 [get_ports cpld_xio6]
set_property IOSTANDARD LVCMOS33 [get_ports cpld_x*]
