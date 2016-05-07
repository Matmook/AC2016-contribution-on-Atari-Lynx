#
# makefile for the www.cc65.org compiler version of abccreator
#

CC=cc65 -t lynx -Cl
CO=co65
RM=rm -f
CP=cp

.SUFFIXES: .c .s

all:	resident.o

# Component target
%.o: %.c
	$(CC) $*.c


clean :
	$(RM) resident.s 
	$(RM) *.o
