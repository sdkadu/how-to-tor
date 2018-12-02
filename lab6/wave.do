onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab6_check/err
add wave -noupdate -divider Main
add wave -noupdate /lab6_check/clk
add wave -noupdate /lab6_check/reset
add wave -noupdate /lab6_check/s
add wave -noupdate /lab6_check/load
add wave -noupdate /lab6_check/in
add wave -noupdate /lab6_check/out
add wave -noupdate -divider Status
add wave -noupdate /lab6_check/N
add wave -noupdate /lab6_check/V
add wave -noupdate /lab6_check/Z
add wave -noupdate /lab6_check/w
add wave -noupdate -divider {State Machine}
add wave -noupdate /lab6_check/DUT/SM/present_state
add wave -noupdate /lab6_check/DUT/SM/next_state
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/nsel
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/vsel
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/loada
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/loadb
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/asel
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/bsel
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/loadc
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/loads
add wave -noupdate -group {SM Signals} /lab6_check/DUT/SM/write
add wave -noupdate -divider Regfiles
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R0
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R1
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R2
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R3
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R4
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R5
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R6
add wave -noupdate /lab6_check/DUT/DP/REGFILE/R7
add wave -noupdate -divider <NULL>
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/irout
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/nsel
add wave -noupdate -group {Decoded Signals (ID)} -divider I/O
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/sximm5
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/sximm8
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/opcode
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/readnum
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/writenum
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/op
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/ALUop
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/shift
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/imm8
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/imm5
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/Rn
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/Rd
add wave -noupdate -group {Decoded Signals (ID)} /lab6_check/DUT/ID/Rm
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 208
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
WaveRestoreZoom {0 ps} {243 ps}
