MY_CFLAGS += -g -DDEBUG
ccflags-y += ${MY_CFLAGS}
CC += ${MY_CFLAGS}

ifneq ($(KERNELRELEASE),)
include Kbuild
else
KSRC ?= /lib/modules/$(shell uname -r)/build/

default:
	make -C $(KSRC) M=$$PWD
debug:
	make -C $(KSRC) M=$$PWD EXTRA_CFLAGS="$(MY_CFLAGS)" modules
clean:
	make -C $(KSRC) M=$$PWD clean

endif
