#
# makefile to create a complete Atari Lynx cart using the
# the www.cc65.org compiler
#
# Currently the only user applications are "intro" for the startup
# and "sketch" for a drawing application.
# If you want more loadable modules you need to add them just like
# the "sketch" is created.
# Note: you need to add them to this Makefile, to the directory.s
# and you have to create a new directory for the new module.
CFLAGS=-Cl
CC65_ASMINC=$(CC65_INC)/../asminc
AS=ca65 -t lynx
CC=cc65 -t lynx $(CFLAGS)
CL=cl65 -t lynx $(CFLAGS)
RM=rm -f
CP=cp
SPRPCK=sprpck
MAKE=make

CFLAGS=

.SUFFIXES: .s .o .c

%.o: %.s
	$(AS) -I "$(CC65_ASMINC)" -o $@ $(AFLAGS) $<

all:	cart.lnx

cart.lnx : \
	directory.o \
	../title/title.o \
	../title/sprites.o \
	../ingame/ingame.o \
	../ingame/sprites.o \
	../resident/resident.o \
	../resident/lynx-snd.o
  
	$(CL) $^ lynx.lib -o ../lnx/ac2016.lnx -m cart.map -C lynxcart.cfg

clean :
	$(RM) *.o
	$(RM) *.pal
	$(RM) *.spr
	$(RM) *.LYX
	$(RM) *.lyx
	$(RM) *.lnx
	$(RM) *.map
	$(RM) null
