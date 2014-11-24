onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider General
add wave -noupdate /group6_singlecycleprocessor_demo/test/datapath/clk
add wave -noupdate /group6_singlecycleprocessor_demo/reset_sig
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/pc0
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/instruction
add wave -noupdate -divider {Data Memory}
add wave -noupdate /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/clk
add wave -noupdate /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/MemWr
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/ALU_Output
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/busB_in
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/Data_Out
add wave -noupdate /group6_singlecycleprocessor_demo/test/datapath/Data_Memory/MemWr_out
add wave -noupdate -divider reg5
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Register_Memory/Reg_A_5/output_mem
add wave -noupdate -divider reg6
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Register_Memory/Reg_A_6/output_mem
add wave -noupdate -divider reg7
add wave -noupdate -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/Register_Memory/Reg_A_7/output_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1498 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 510
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {72 ns}
