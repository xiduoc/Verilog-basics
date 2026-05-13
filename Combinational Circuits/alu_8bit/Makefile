SRC = alu_8bit.sv alu_8bit_tb.sv
OUT = alu_8bit.vvp
WAVE = alu_8bit.vcd
FLAGS = -Wall -g2012

all: sim

compile:
	iverilog $(FLAGS) -o $(OUT) $(SRC)

sim: compile
	vvp $(OUT)

wave: sim
	gtkwave $(WAVE) &

clean: 
	rm -f $(OUT) $(WAVE)