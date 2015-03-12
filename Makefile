% :
	vlog $*.sv
	vsim -c -do run.do work.$*
