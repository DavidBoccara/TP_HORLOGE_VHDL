onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/top_test/pll1_c0
add wave -noupdate /top_tb/top_test/key
add wave -noupdate /top_tb/top_test/hex0
add wave -noupdate /top_tb/top_test/hex1
add wave -noupdate /top_tb/top_test/hex2
add wave -noupdate /top_tb/top_test/hex3
add wave -noupdate /top_tb/top_test/hex4
add wave -noupdate /top_tb/top_test/hex5
add wave -noupdate /top_tb/top_test/ledr
add wave -noupdate /top_tb/top_test/cnt
add wave -noupdate /top_tb/top_test/rst
add wave -noupdate /top_tb/top_test/mode
add wave -noupdate /top_tb/top_test/push1
add wave -noupdate /top_tb/top_test/push2
add wave -noupdate /top_tb/top_test/seconde_A
add wave -noupdate /top_tb/top_test/minute_A
add wave -noupdate /top_tb/top_test/seconde_B
add wave -noupdate /top_tb/top_test/minute_B
add wave -noupdate /top_tb/top_test/heure_A
add wave -noupdate /top_tb/top_test/heure_B
add wave -noupdate /top_tb/top_test/seconde_alarme_A
add wave -noupdate /top_tb/top_test/minute_alarme_A
add wave -noupdate /top_tb/top_test/seconde_alarme_B
add wave -noupdate /top_tb/top_test/minute_alarme_B
add wave -noupdate /top_tb/top_test/heure_alarme_A
add wave -noupdate /top_tb/top_test/heure_alarme_B
add wave -noupdate /top_tb/top_test/pll1_locked
add wave -noupdate /top_tb/top_test/top_1s
add wave -noupdate /top_tb/pll1_c0
add wave -noupdate /top_tb/rst
add wave -noupdate /top_tb/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3015010154822 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 176
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {8343424327808 ps}
