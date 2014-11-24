onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/pc0
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busa
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb_in
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busw
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/clk
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_out
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/equal
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/imm_extended
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/rs
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/rt
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/aluctr
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/regwr
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/rst
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/instruction
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/alu_output
add wave -noupdate -divider Memory
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rw
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_memory/data_out
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_memory/busb_in
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_memory/alu_output
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/data_memory/memwr_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ns} 0}
configure wave -namecolwidth 533
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
WaveRestoreZoom {10 ns} {36 ns}
