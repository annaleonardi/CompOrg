All: Feet2Inches F2C
LIB=libConversions.o
CC=gcc

Feet2Inches: Feet2Inches.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

F2C: F2C.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
