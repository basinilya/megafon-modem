#
# Makefile for the USB Mass Storage device drivers.
#
# 15 Aug 2000, Christoph Hellwig <hch@infradead.org>
# Rewritten to use lists instead of if-statements.
#

INCDIR	:= /lib/modules/$(uname -r)/build/drivers/scsi

KVER	:= $(shell uname -r)
KDIR	:= /lib/modules/$(KVER)/build

modules:
	$(MAKE) -C $(KDIR) -I $(INCDIR) SUBDIRS=$(PWD)/src modules

obj-m	+= hw_usb-storage.o

usb-storage-obj-y	+= shuttle_usbat.o
usb-storage-obj-y	+= sddr09.o
usb-storage-obj-y	+= sddr55.o
usb-storage-obj-y	+= freecom.o
usb-storage-obj-y	+= dpcm.o
usb-storage-obj-y	+= isd200.o
usb-storage-obj-y	+= datafab.o
usb-storage-obj-y	+= jumpshot.o
usb-storage-obj-y	+= alauda.o
usb-storage-obj-y	+= onetouch.o
usb-storage-obj-y	+= karma.o
usb-storage-obj-y 	+= cypress_atacb.o


hw_usb-storage-objs :=	scsiglue.o protocol.o transport.o usb.o \
			initializers.o sierra_ms.o $(usb-storage-obj-y)


clean:
	rm -rf *.o *.ko *~ core* .dep* .*.d .*.cmd *.mod.c *.a *.s .*.flags .tmp_versions Module.symvers Moduler.symvers *.order
	rmmod -f hw_usb-storage
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/usb/storage/hw_usb-storage.ko
	depmod -a

install:
	install -m 744 -c hw_usb-storage.ko /lib/modules/$(shell uname -r)/kernel/drivers/usb/storage/
	depmod -a
	modprobe hw_usb-storage
 


