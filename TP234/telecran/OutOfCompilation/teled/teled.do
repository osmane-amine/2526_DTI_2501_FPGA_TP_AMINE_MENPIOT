quit -sim

vlib work

vcom teled.vhd
vcom teled_tb.vhd
vcom detector.vhd
vcom multiplexer.vhd
vsim -c work.teled_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow tld/i_clk_50
add wave -color yellow tld/i_rst_n
add wave -color yellow tld/i_en_not
add wave -color yellow tld/i_ch_a
add wave -color yellow tld/i_ch_b


# OUPUTS
add wave -divider Outputs:
add wave tld/o_led

run -all