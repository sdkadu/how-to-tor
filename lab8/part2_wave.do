onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Keys and Clocks}
add wave -noupdate /lab8_stage2_tb/KEY
add wave -noupdate /lab8_stage2_tb/SW
add wave -noupdate /lab8_stage2_tb/LEDR
add wave -noupdate /lab8_stage2_tb/HEX0
add wave -noupdate /lab8_stage2_tb/HEX1
add wave -noupdate /lab8_stage2_tb/HEX2
add wave -noupdate /lab8_stage2_tb/HEX3
add wave -noupdate /lab8_stage2_tb/HEX4
add wave -noupdate /lab8_stage2_tb/HEX5
add wave -noupdate /lab8_stage2_tb/err
add wave -noupdate /lab8_stage2_tb/CLOCK_50
add wave -noupdate /lab8_stage2_tb/break
add wave -noupdate -divider Operations
add wave -noupdate /lab8_stage2_tb/DUT/CPU/opcode
add wave -noupdate /lab8_stage2_tb/DUT/CPU/op
add wave -noupdate /lab8_stage2_tb/DUT/CPU/ALUop
add wave -noupdate /lab8_stage2_tb/DUT/CPU/Bcond
add wave -noupdate -divider {Program Counter}
add wave -noupdate /lab8_stage2_tb/DUT/CPU/reset_pc
add wave -noupdate /lab8_stage2_tb/DUT/CPU/load_pc
add wave -noupdate /lab8_stage2_tb/DUT/CPU/PC
add wave -noupdate /lab8_stage2_tb/DUT/CPU/new_pc
add wave -noupdate /lab8_stage2_tb/DUT/CPU/next_pc
add wave -noupdate /lab8_stage2_tb/DUT/CPU/pc_select
add wave -noupdate /lab8_stage2_tb/DUT/CPU/pc_addOne
add wave -noupdate /lab8_stage2_tb/DUT/CPU/pc_addI
add wave -noupdate /lab8_stage2_tb/DUT/CPU/pc_addImm
add wave -noupdate /lab8_stage2_tb/DUT/CPU/sximm8
add wave -noupdate -divider {State Machine}
add wave -noupdate /lab8_stage2_tb/DUT/CPU/readnum
add wave -noupdate /lab8_stage2_tb/DUT/CPU/writenum
add wave -noupdate /lab8_stage2_tb/DUT/CPU/nsel
add wave -noupdate /lab8_stage2_tb/DUT/CPU/vsel
add wave -noupdate /lab8_stage2_tb/DUT/CPU/write
add wave -noupdate /lab8_stage2_tb/DUT/CPU/load_ir
add wave -noupdate -divider {MEM and Reg}
add wave -noupdate -radix decimal {/lab8_stage2_tb/DUT/MEM/mem[26]}
add wave -noupdate -radix decimal {/lab8_stage2_tb/DUT/MEM/mem[25]}
add wave -noupdate -radix decimal {/lab8_stage2_tb/DUT/MEM/mem[255]}
add wave -noupdate -radix decimal {/lab8_stage2_tb/DUT/MEM/mem[254]}
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate -radix decimal /lab8_stage2_tb/DUT/CPU/DP/REGFILE/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1467 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 101
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
WaveRestoreZoom {643460 ps} {643782 ps}
