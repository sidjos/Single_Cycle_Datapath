onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -itemcolor Cyan /group6_singlecycleprocessor_demo/clock
add wave -noupdate -color Yellow -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busa
add wave -noupdate -color Yellow -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb_in
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/alu_output
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/and_memwr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busw_out
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/and_regwr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/imm16
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/instruction
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_out
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/pc0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {178 ns} 0}
configure wave -namecolwidth 427
configure wave -valuecolwidth 100
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
update
WaveRestoreZoom {0 ns} {44 ns}
