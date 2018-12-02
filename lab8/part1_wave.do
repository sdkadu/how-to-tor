onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R7
add wave -noupdate -divider Autograder
add wave -noupdate /lab8_check_tb/CLOCK_50
add wave -noupdate /lab8_check_tb/KEY
add wave -noupdate /lab8_check_tb/SW
add wave -noupdate /lab8_check_tb/LEDR
add wave -noupdate /lab8_check_tb/HEX0
add wave -noupdate /lab8_check_tb/HEX1
add wave -noupdate /lab8_check_tb/HEX2
add wave -noupdate /lab8_check_tb/HEX3
add wave -noupdate /lab8_check_tb/HEX4
add wave -noupdate /lab8_check_tb/HEX5
add wave -noupdate /lab8_check_tb/err
add wave -noupdate -divider {Top and States}
add wave -noupdate /lab8_check_tb/DUT/present_state
add wave -noupdate /lab8_check_tb/DUT/N
add wave -noupdate /lab8_check_tb/DUT/V
add wave -noupdate /lab8_check_tb/DUT/Z
add wave -noupdate -divider {State Machine}
add wave -noupdate /lab8_check_tb/DUT/CPU/sximm8
add wave -noupdate /lab8_check_tb/DUT/CPU/opcode
add wave -noupdate /lab8_check_tb/DUT/CPU/op
add wave -noupdate /lab8_check_tb/DUT/CPU/Bcond
add wave -noupdate /lab8_check_tb/DUT/CPU/stat_out
add wave -noupdate /lab8_check_tb/DUT/CPU/out
add wave -noupdate /lab8_check_tb/DUT/CPU/N
add wave -noupdate /lab8_check_tb/DUT/CPU/V
add wave -noupdate /lab8_check_tb/DUT/CPU/Z
add wave -noupdate -divider PC
add wave -noupdate /lab8_check_tb/DUT/CPU/pc_select
add wave -noupdate /lab8_check_tb/DUT/CPU/pc_addOne
add wave -noupdate /lab8_check_tb/DUT/CPU/pc_addImm
add wave -noupdate /lab8_check_tb/DUT/CPU/new_pc
add wave -noupdate /lab8_check_tb/DUT/CPU/load_pc
add wave -noupdate /lab8_check_tb/DUT/CPU/reset_pc
add wave -noupdate /lab8_check_tb/DUT/CPU/next_pc
add wave -noupdate /lab8_check_tb/DUT/CPU/PC
add wave -noupdate -divider Registers
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate /lab8_check_tb/DUT/CPU/DP/REGFILE/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {805 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {3492663 ps} {3493045 ps}
