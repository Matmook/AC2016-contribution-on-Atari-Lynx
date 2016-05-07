CP=cp
RM=rm -f

all:
	$(MAKE) -C resident
	$(MAKE) -C title
	$(MAKE) -C ingame
	$(MAKE) -C cart

clean:
	$(MAKE) -C resident clean
	$(MAKE) -C title clean
	$(MAKE) -C ingame clean
	$(MAKE) -C cart clean
	$(RM) lnx/cart.lnx
