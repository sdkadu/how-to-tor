onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab7_check_tb/DUT/clk
add wave -noupdate /lab7_check_tb/DUT/reset
add wave -noupdate -divider Keys
add wave -noupdate /lab7_check_tb/DUT/KEY
add wave -noupdate /lab7_check_tb/DUT/SW
add wave -noupdate /lab7_check_tb/DUT/LEDR
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX0
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX1
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX2
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX3
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX4
add wave -noupdate -group HEX /lab7_check_tb/DUT/HEX5
add wave -noupdate -divider {Top Path}
add wave -noupdate /lab7_check_tb/DUT/din
add wave -noupdate /lab7_check_tb/DUT/dout
add wave -noupdate /lab7_check_tb/DUT/write_data
add wave -noupdate /lab7_check_tb/DUT/mem_addr
add wave -noupdate /lab7_check_tb/DUT/read_address
add wave -noupdate /lab7_check_tb/DUT/write_address
add wave -noupdate /lab7_check_tb/DUT/msel
add wave -noupdate /lab7_check_tb/DUT/write
add wave -noupdate -group Write /lab7_check_tb/DUT/weq
add wave -noupdate -group Write /lab7_check_tb/DUT/req
add wave -noupdate /lab7_check_tb/DUT/mtse
add wave -noupdate /lab7_check_tb/DUT/mem_cmd
add wave -noupdate /lab7_check_tb/DUT/read_data
add wave -noupdate -group {Misc Info (Lab 6)} /lab7_check_tb/DUT/N
add wave -noupdate -group {Misc Info (Lab 6)} /lab7_check_tb/DUT/V
add wave -noupdate -group {Misc Info (Lab 6)} /lab7_check_tb/DUT/Z
add wave -noupdate -group {Misc Info (Lab 6)} /lab7_check_tb/DUT/w
add wave -noupdate /lab7_check_tb/DUT/switch_control
add wave -noupdate /lab7_check_tb/DUT/LED_control
add wave -noupdate -divider {State Machine}
add wave -noupdate /lab7_check_tb/DUT/CPU/SM/present_state
add wave -noupdate /lab7_check_tb/DUT/CPU/SM/next_state
add wave -noupdate -expand -group Opcodes /lab7_check_tb/DUT/CPU/SM/opcode
add wave -noupdate -expand -group Opcodes /lab7_check_tb/DUT/CPU/SM/op
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/nsel
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/vsel
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/loada
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/asel
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/DP/Ain
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/DP/Aout
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/loadb
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/bsel
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/DP/Bin
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/DP/Bout
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/loadc
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/loads
add wave -noupdate -expand -group {Internal Signals (I/O)} /lab7_check_tb/DUT/CPU/SM/write
add wave -noupdate -expand -group {Instruction Register} /lab7_check_tb/DUT/CPU/SM/load_ir
add wave -noupdate -expand -group {Instruction Register} /lab7_check_tb/DUT/CPU/read_data
add wave -noupdate -expand -group {Instruction Register} /lab7_check_tb/DUT/CPU/irout
add wave -noupdate -expand -group {Data Address} /lab7_check_tb/DUT/CPU/SM/load_addr
add wave -noupdate -expand -group {Data Address} /lab7_check_tb/DUT/CPU/SM/addr_sel
add wave -noupdate -expand -group {Data Address} /lab7_check_tb/DUT/CPU/mem_addr
add wave -noupdate /lab7_check_tb/DUT/CPU/SM/mem_cmd
add wave -noupdate -divider {Program Counter}
add wave -noupdate /lab7_check_tb/DUT/CPU/SM/load_pc
add wave -noupdate /lab7_check_tb/DUT/CPU/SM/reset_pc
add wave -noupdate /lab7_check_tb/DUT/CPU/next_pc
add wave -noupdate /lab7_check_tb/DUT/CPU/PC
add wave -noupdate /lab7_check_tb/DUT/CPU/data_address
add wave -noupdate -divider Register
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R6
add wave -noupdate /lab7_check_tb/DUT/CPU/DP/REGFILE/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {195 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
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
WaveRestoreZoom {0 ps} {205 ps}
