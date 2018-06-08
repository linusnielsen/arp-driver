MY_CFLAGS += -g -DDEBUG
ccflags-y += ${MY_CFLAGS}
CC += ${MY_CFLAGS}
SRC := $(shell pwd)

ifneq ($(KERNELRELEASE),)
include Kbuild
else
KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build/

default:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
debug:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) EXTRA_CFLAGS="$(MY_CFLAGS)" modules
clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) clean
modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

endif
