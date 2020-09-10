onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /impulsion_tb/clk
add wave -noupdate /impulsion_tb/rst
add wave -noupdate /impulsion_tb/top_1s
add wave -noupdate /impulsion_tb/impulsion/clk
add wave -noupdate /impulsion_tb/impulsion/rst
add wave -noupdate /impulsion_tb/impulsion/top_1s
add wave -noupdate /impulsion_tb/impulsion/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200 ms} 0}
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
configure wave -timelineunits ms
update
WaveRestoreZoom {100 ms} {2100 ms}
