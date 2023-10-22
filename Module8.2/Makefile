# Makefile for ARM Assembly Programs

LIB = libConversions.s  #Define a variable LIB with the name of the library source file.
KPH = kph.s  #Define a variable KPH with the name of the kph source file

CC = gcc  #Define the C compiler (gcc) as CC.
AS = as  #Define the assembler (as) as AS

all: miles2kilometer kph CToF InchesToFt  # Define a target 'all' that depends on four executable files: miles2kilometer, kph, CToF, and InchesToFt
	
miles2kilometer: miles2kilometer.o libConversions.o
	# Define a target 'miles2kilometer' that depends on two object files: miles2kilometer.o and libConversions.o
	$(CC) -o $@ miles2kilometer.o libConversions.o
	# Use the C compiler (gcc) to link the object files and create an executable 'miles2kilometer'
	
kph: kph.o libConversions.o
	# Define a target 'kph' that depends on two object files: kph.o and libConversions.o
	$(CC) -o $@ kph.o libConversions.o
	#  Use the C compiler (gcc) to link the object files and create an executable 'kph'	

CToF: CToF.o libConversions.o
	# Define a target 'CToF' that depends on two object files: CToF.o and libConversions.o
	$(CC) -o $@ CToF.o libConversions.o
	# Use the C compiler (gcc) to link the object files and create an executable 'CToF'
	
InchesToFt: InchesToFt.o libConversions.o
	# Define a target 'InchesToFt' that depends on two object files: InchesToFt.o and libConversions.o
	$(CC) -o $@ InchesToFt.o libConversions.o
	# Use the C compiler (gcc) to link the object files and create an executable 'InchesToFt'
	
libConversions.o: $(LIB)
	# Define a target 'libConversions.o' that depends on the library source file (libConversions.s)
	$(AS) -g -o $@ $(LIB)
	# Use the assembler (as) to assemble the library source file and create an object file

%.o: %.s
	# Define a pattern rule for generating object files from assembly source files
	$(AS) -g -o $@ $<
	# Use the assembler (as) to assemble the source file ($<) into an object file ($@)

clean:
	rm -f miles2kilometer kph CToF InchesToFt libConversions.o *.o
	# Remove the executables and object files, leaving only source files and the library




