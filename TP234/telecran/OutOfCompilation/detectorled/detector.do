quit -sim

vlib work

vcom detector.vhd
vcom detector_tb.vhd

vsim -c work.detector_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/i_clk_50
add wave -color yellow uut/i_rst_n
add wave -color yellow uut/i_en
add wave -color yellow uut/i_ch_a
add wave -color yellow uut/i_ch_b

# OUPUTS
add wave -divider Outputs:
add wave uut/o_count
add wave uut/o_led

run -all