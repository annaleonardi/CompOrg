All: miles2kilometer kph
LIB=libConversions.o
CC=gcc

miles2kilometer: miles2kilometer.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

kph: kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
