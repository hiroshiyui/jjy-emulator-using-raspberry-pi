.PHONY: all pigpio clean
# For Raspberry 1 (non-armhf):
CROSS_PREFIX=arm-linux-gnueabi-
CC=gcc
PIGPIO_PATH=./pigpio

all: pigpio
	$(CROSS_PREFIX)$(CC) -I$(PIGPIO_PATH) -L$(PIGPIO_PATH) -o jjy jjy.c -lpigpio -lrt

pigpio:
	$(MAKE) CROSS_PREFIX=$(CROSS_PREFIX) -C $(PIGPIO_PATH)

clean:
	rm ./jjy	
	$(MAKE) -C $(PIGPIO_PATH) clean
