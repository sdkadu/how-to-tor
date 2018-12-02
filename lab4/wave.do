onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab4_tb/directionSwitch
add wave -noupdate /lab4_tb/resetNclock
add wave -noupdate /lab4_tb/dut/state
add wave -noupdate /lab4_tb/dut/nxtState
add wave -noupdate /lab4_tb/dut/direction
add wave -noupdate /lab4_tb/dut/reset
add wave -noupdate /lab4_tb/dut/clock
add wave -noupdate /lab4_tb/dut/HEX0
add wave -noupdate /lab4_tb/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ps} 0}
quietly wave cursor active 1
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
