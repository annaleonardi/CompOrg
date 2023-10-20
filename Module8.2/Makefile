# Makefile for ARM Assembly Programs

LIB = libConversions.s
KPH = kph.s

CC = gcc
AS = as

all: miles2kilometer kph CToF InchesToFt

miles2kilometer: miles2kilometer.o libConversions.o
	$(CC) -o $@ miles2kilometer.o libConversions.o

kph: kph.o libConversions.o
	$(CC) -o $@ kph.o libConversions.o

CToF: CToF.o libConversions.o
	$(CC) -o $@ CToF.o libConversions.o

InchesToFt: InchesToFt.o libConversions.o
	$(CC) -o $@ InchesToFt.o libConversions.o

libConversions.o: $(LIB)
	$(AS) -g -o $@ $(LIB)

%.o: %.s
	$(AS) -g -o $@ $<

clean:
	rm -f miles2kilometer kph CToF InchesToFt libConversions.o *.o




