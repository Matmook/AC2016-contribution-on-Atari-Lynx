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
CODE_SEGMENT=TITLE_CODE
DATA_SEGMENT=TITLE_DATA
RODATA_SEGMENT=TITLE_RODATA
BSS_SEGMENT=TITLE_BSS

.SUFFIXES: .o .c .s

all:	title.o sprites.o

sprites.o :
	$(AS) -t lynx -o sprites.o sprites.s

%.o: %.c
	$(CC) --code-name $(CODE_SEGMENT) \
	--rodata-name $(RODATA_SEGMENT) \
	--bss-name $(BSS_SEGMENT) \
	--data-name $(DATA_SEGMENT) $*.c
	$(AS) -t lynx -o $*.o $(AFLAGS) $*.s


clean :
	$(RM) *.o
