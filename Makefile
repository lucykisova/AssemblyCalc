# make all six calc test files
calc_basic: calc.o and.o or.o sum.o upper.o data/basic_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/basic_cmds.o -o calc_basic

calc_simpleone: calc.o and.o or.o sum.o upper.o data/simpleone_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/simpleone_cmds.o -o calc_simpleone

calc_simplerandom: calc.o and.o or.o sum.o upper.o data/simplerandom_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/simplerandom_cmds.o -o calc_simplerandom

calc_upperonly: calc.o and.o or.o sum.o upper.o data/upperonly_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/upperonly_cmds.o -o calc_upperonly

calc_easy: calc.o and.o or.o sum.o upper.o data/easy_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/easy_cmds.o -o calc_easy

calc_basicwithupper: calc.o and.o or.o sum.o upper.o data/basicwithupper_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/basicwithupper_cmds.o -o calc_basicwithupper

# make calc object file
calc.o: calc.s
	as -g calc.s -o calc.o

# make object files of data for each calc test file
data/basic_cmds.o: data/basic_cmds.s
	as -g data/basic_cmds.s -o data/basic_cmds.o

data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o data/simpleone_cmds.o

data/simplerandom_cmds.o: data/simplerandom_cmds.s
	as -g data/simplerandom_cmds.s -o data/simplerandom_cmds.o

data/upperonly_cmds.o: data/upperonly_cmds.s
	as -g data/upperonly_cmds.s -o data/upperonly_cmds.o

data/easy_cmds.o: data/easy_cmds.o
	as -g data/easy_cmds.s -o data/easy_cmds.o

data/basicwithupper_cmds.o: data/basicwithupper_cmds.s
	as -g data/basicwithupper_cmds.s -o data/basicwithupper_cmds.o

# make object files for each function (and, or, sum, upper)
and.o: and.s
	as -g and.s -o and.o

or.o: or.s
	as -g or.s -o or.o

sum.o: sum.s
	as -g sum.s -o sum.o

upper.o: upper.s
	as -g upper.s -o upper.o

# make dummy test file
dummy: dummy.o
	ld -g dummy.o data/basic_cmds.o -o dummy

dummy.o: dummy.s
	as -g dummy.s -o dummy.o
