if {[string compare [layout current] "Simulate"]==0} { quit -sim }
if {[file exist work]} { file delete -force work }

vlib work
project compileall
variable NumericStdNoWarnings 1
vsim -t ps -quiet work.top_tb -voptargs=+acc
do wave_top.do
log -r *
run 1500 us
