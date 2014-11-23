onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/clk
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busa
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busb_in
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/busw_out
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rw_out
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/register_memory/regwr_out
add wave -noupdate -divider -height 25 Important
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rs
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rt
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/data_out
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/equal
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/extop
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/imm16
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/memtoreg
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/memwr
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/ovf
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/rd
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/regdst
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/regwr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/register_memory/busw_out
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rd
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/alu_output
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/cout
add wave -noupdate -format Logic /group6_singlecycleprocessor_demo/test/datapath/alusrc
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/aluctr
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/busw
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/datapath/imm_extended
add wave -noupdate -format Literal /group6_singlecycleprocessor_demo/test/datapath/register_memory/rw
add wave -noupdate -format Literal -radix hexadecimal /group6_singlecycleprocessor_demo/test/instruction_fetch/pc0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75 ns} 0}
configure wave -namecolwidth 501
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
WaveRestoreZoom {72 ns} {104 ns}
