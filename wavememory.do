onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/clk
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busa
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb_in
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/busw_out
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rw_out
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/register_memory/regwr_out
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/pc0
add wave -noupdate -divider -height 25 Important
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram0_map/addr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram0_map/dout
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram0_map/din
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram0_map/we
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram1_map/addr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram1_map/din
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram1_map/dout
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/register_memory/sram1_map/we
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75 ns} 0}
configure wave -namecolwidth 569
configure wave -valuecolwidth 72
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
WaveRestoreZoom {34 ns} {63 ns}
