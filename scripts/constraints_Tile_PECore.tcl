create_clock -name clk -period 3 -waveform {0 1.5} [get_ports clk*]
set_input_delay -max 0.2 -clock clk [all_inputs]
set_output_delay -max 0.2 -clock clk [all_outputs]
set_input_delay -min 0 -clock clk [all_inputs]
set_output_delay -min 0 -clock clk [all_outputs]

set_load 0.1 [all_outputs]
set_input_transition 0.2 [all_inputs]

set constant_regs [all_fanout -from [get_ports config_config_data*] -flat -endpoints_only -only_cells]
set_false_path -from [get_pins -of $constant_regs -filter "is_clock_pin==true"]
set_false_path -to [get_pins -of $constant_regs -filter "is_data_pin==true"]
set_false_path -from [get_ports {config* tile_id* reset} -filter "direction==in"] -to [all_outputs]
