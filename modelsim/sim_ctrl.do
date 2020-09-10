if {[string compare [layout current] "Simulate"]==0} { quit -sim }
if {[file exist work]} { file delete -force work }

vlib work
project compileall
vsim -t ps -quiet -novopt work.ctrl_tb
do wave_ctrl.do
log -r *
run 20 ms
