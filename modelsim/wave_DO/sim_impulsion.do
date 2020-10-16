if {[string compare [layout current] "Simulate"]==0} { quit -sim }
if {[file exist work]} { file delete -force work }

vlib work
project compileall
vsim -t ps -quiet work.impulsion_tb -voptargs=+acc
do wave_impulsion.do
log -r *
run 100 us
