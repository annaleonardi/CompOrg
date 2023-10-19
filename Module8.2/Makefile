All: miles2kilometer
LIB=libConversions.o
CC=gcc

miles2kilometer: miles2kilometer.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
