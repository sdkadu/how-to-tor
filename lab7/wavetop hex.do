onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab7_top_tb/DUT/clk
add wave -noupdate /lab7_top_tb/DUT/reset
add wave -noupdate -divider Registers
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate -divider DeSoC
add wave -noupdate /lab7_top_tb/DUT/CPU/DP/REGFILE/R7
add wave -noupdate /lab7_top_tb/KEY
add wave -noupdate /lab7_top_tb/SW
add wave -noupdate /lab7_top_tb/LEDR
add wave -noupdate /lab7_top_tb/HEX0
add wave -noupdate /lab7_top_tb/HEX1
add wave -noupdate /lab7_top_tb/HEX2
add wave -noupdate /lab7_top_tb/HEX3
add wave -noupdate /lab7_top_tb/HEX4
add wave -noupdate /lab7_top_tb/HEX5
add wave -noupdate /lab7_top_tb/err
add wave -noupdate -divider {SM Output Signals}
add wave -noupdate /lab7_top_tb/DUT/N
add wave -noupdate /lab7_top_tb/DUT/V
add wave -noupdate /lab7_top_tb/DUT/Z
add wave -noupdate /lab7_top_tb/DUT/w
add wave -noupdate -divider HEX
add wave -noupdate /lab7_top_tb/DUT/PC
add wave -noupdate /lab7_top_tb/DUT/present_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
