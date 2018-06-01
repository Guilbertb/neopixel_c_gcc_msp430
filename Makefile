CC=msp430-gcc
CFLAGS=-Os -Wall -g -mmcu=msp430g2553 -L/usr/lib/x86_64-linux-gnu/
 
OBJS=neopix.o ws2812.o
SRC=neopix.c ws2812.c
 
all: $(OBJS)
	$(CC) $(CFLAGS) -o neopix.elf $(SRC)
 
%.o: %.c
	$(CC) $(CFLAGS) -c $<
 
clean:
	rm -fr main.elf $(OBJS)
 
upload:
	mspdebug rf2500 "prog neopix.elf"

