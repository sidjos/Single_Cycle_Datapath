onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /g6/test/datapath/Clk
add wave -noupdate -radix binary /g6/test/datapath/ALUCtr
add wave -noupdate /g6/test/datapath/ALUSrc
add wave -noupdate -radix hexadecimal /g6/test/datapath/ALU_Output
add wave -noupdate -radix hexadecimal /g6/test/datapath/busA
add wave -noupdate -radix hexadecimal /g6/test/datapath/busB
add wave -noupdate -radix hexadecimal /g6/test/datapath/busB_In
add wave -noupdate -radix hexadecimal /g6/test/datapath/busW
add wave -noupdate -radix hexadecimal /g6/test/datapath/busW_out
add wave -noupdate /g6/test/datapath/Rw
add wave -noupdate /g6/test/datapath/Rd
add wave -noupdate /g6/test/datapath/Rs
add wave -noupdate /g6/test/datapath/Rt
add wave -noupdate /g6/test/datapath/imm16
add wave -noupdate /g6/test/datapath/imm_extended
add wave -noupdate /g6/test/datapath/RegDst
add wave -noupdate /g6/test/datapath/RegWr
add wave -noupdate /g6/test/datapath/Data_Out
add wave -noupdate /g6/test/datapath/AND_MemWr
add wave -noupdate /g6/test/datapath/AND_RegWr
add wave -noupdate /g6/test/datapath/Equal
add wave -noupdate /g6/test/datapath/ExtOp
add wave -noupdate /g6/test/datapath/MemWr
add wave -noupdate /g6/test/datapath/MemtoReg
add wave -noupdate /g6/test/datapath/cout
add wave -noupdate /g6/test/datapath/ovf
add wave -noupdate /g6/test/instruction_fetch/pc0
add wave -noupdate /g6/test/datapath/alu_map/zero
add wave -noupdate /g6/test/control/Branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {444 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 82
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
configure wave -timelineunits ns
update
WaveRestoreZoom {436 ns} {498 ns}
