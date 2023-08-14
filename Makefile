# Makefile for C & Fortran interoperability

F90=gfortran
CC=gcc
STD=-std=c17
OPT=-O1
CFLAGS=$(STD) -Wall -Wextra -Werror -g $(OPT)

# All the Fortran files in the current directory
FFILES=$(wildcard *.f90)

# All the C files in the current directory
CFILES=$(wildcard *.c)
# All the object files
OBJECT=$(CFILES:.c=.o)

# The generated binary file
BINARY=output

all:$(BINARY)

$(BINARY):$(OBJECT)
	$(F90) $(FFILES) -o $@ $^

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -rf $(OBJECT) $(BINARY)
