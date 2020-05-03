
create_clock -name {main_clock} -period 133Mhz [get_ports {i_CLK}]

derive_clock_uncertainty

