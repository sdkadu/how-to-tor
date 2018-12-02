onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab8_BLX_tb/KEY
add wave -noupdate /lab8_BLX_tb/SW
add wave -noupdate /lab8_BLX_tb/LEDR
add wave -noupdate /lab8_BLX_tb/HEX0
add wave -noupdate /lab8_BLX_tb/HEX1
add wave -noupdate /lab8_BLX_tb/HEX2
add wave -noupdate /lab8_BLX_tb/HEX3
add wave -noupdate /lab8_BLX_tb/HEX4
add wave -noupdate /lab8_BLX_tb/HEX5
add wave -noupdate /lab8_BLX_tb/err
add wave -noupdate /lab8_BLX_tb/CLOCK_50
add wave -noupdate /lab8_BLX_tb/break
add wave -noupdate -divider Registers
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate /lab8_BLX_tb/DUT/CPU/DP/REGFILE/R7
add wave -noupdate /lab8_BLX_tb/DUT/CPU/PC
add wave -noupdate -divider {Program Counter}
add wave -noupdate /lab8_BLX_tb/DUT/CPU/new_pc
add wave -noupdate /lab8_BLX_tb/DUT/CPU/pc_select
add wave -noupdate /lab8_BLX_tb/DUT/CPU/reset_pc
add wave -noupdate /lab8_BLX_tb/DUT/CPU/load_pc
add wave -noupdate /lab8_BLX_tb/DUT/CPU/next_pc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
