# Makefile for ARM Assembly Programs

LIB = libConversions.s
KPH = kph.s

CC = gcc
AS = as

all: miles2kilometer kph

miles2kilometer: miles2kilometer.o libConversions.o
	$(CC) -o $@ miles2kilometer.o libConversions.o

kph: kph.o libConversions.o
	$(CC) -o $@ kph.o libConversions.o

libConversions.o: $(LIB)
	$(AS) -g -o $@ $(LIB)

%.o: %.s
	$(AS) -g -o $@ $<

clean:
	rm -f miles2kilometer kph libConversions.o *.o




