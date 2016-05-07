#
# makefile for the www.cc65.org compiler version of abccreator
#
CFLAGS=-Cl
CC=cc65 -t lynx $(CFLAGS)
AS=ca65

RM=rm -f
CP=cp
SPRPCK=sprpck
ECHO=echo
CODE_SEGMENT=INGAME_CODE
DATA_SEGMENT=INGAME_DATA
RODATA_SEGMENT=INGAME_RODATA
BSS_SEGMENT=INGAME_BSS

.SUFFIXES: .o .c .s

all:	ingame.o 

%.o: %.c
	$(CC) --code-name $(CODE_SEGMENT) \
	--rodata-name $(RODATA_SEGMENT) \
	--bss-name $(BSS_SEGMENT) \
	--data-name $(DATA_SEGMENT) $*.c
	$(AS) -t lynx -o $*.o $(AFLAGS) $*.s


clean :
	$(RM) *.o
