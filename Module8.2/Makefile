
# Makefile for ARM Assembly Programs

LIB = libConversions.s
KPH = kph.s

CC = gcc
AS = as

all: miles2kilometer kph

miles2kilometer: miles2kilometer.o $(LIB)
	$(CC) -o $@ miles2kilometer.o $(LIB)

kph: kph.o $(LIB)
	$(CC) -o $@ kph.o $(LIB)

%.o: %.s
	$(AS) -g -o $@ $<

clean:
	rm -f miles2kilometer kph *.o

