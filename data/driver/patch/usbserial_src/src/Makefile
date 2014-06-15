################################################################################
# 
# Copyright(c) Realtek Semiconductor Corp. All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify it 
# under the terms of the GNU General Public License as published by the Free 
# Software Foundation; either version 2 of the License, or (at your option) 
# any later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT 
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
# more details.
# 
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 59 
# Temple Place - Suite 330, Boston, MA  02111-1307, USA.
# 
# The full GNU General Public License is included in this distribution in the
# file called LICENSE.
# 
################################################################################

KVER		:= $(shell uname -r)
KDIR		:= /lib/modules/$(KVER)/build
KMISC		:= /lib/modules/$(KVER)/kernel/drivers/usb/serial
KEXT		:= $(shell echo $(KVER) | sed -ne 's/^2\.[567]\..*/k/p')o



modules:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD)/src modules
	strip --strip-debug usbserial.$(KEXT)

clean:
	rm -rf *.o *.ko *~ core* .dep* .*.d .*.cmd *.mod.c *.a *.s .*.flags .tmp_versions Module.symvers Modules.symvers *.order

install:
	install -m 744 -c option.$(KEXT) $(KMISC)
	depmod -a
	modprobe usbserial
	

#usbserial-objs := usb-serial.o
#obj-m += usbserial.o
obj-$(CONFIG_USB_SERIAL)			+= usbserial.o

usbserial-obj-$(CONFIG_USB_SERIAL_CONSOLE)	+= console.o
usbserial-obj-$(CONFIG_USB_EZUSB)		+= ezusb.o

usbserial-objs	:= usb-serial.o generic.o bus.o $(usbserial-obj-y)

obj-$(CONFIG_USB_SERIAL_AIRCABLE)		+= aircable.o
obj-$(CONFIG_USB_SERIAL_ARK3116)		+= ark3116.o
obj-$(CONFIG_USB_SERIAL_BELKIN)			+= belkin_sa.o
obj-$(CONFIG_USB_SERIAL_CH341)			+= ch341.o
obj-$(CONFIG_USB_SERIAL_CP2101)			+= cp2101.o
obj-$(CONFIG_USB_SERIAL_CYBERJACK)		+= cyberjack.o
obj-$(CONFIG_USB_SERIAL_CYPRESS_M8)		+= cypress_m8.o
obj-$(CONFIG_USB_SERIAL_DEBUG)			+= usb_debug.o
obj-$(CONFIG_USB_SERIAL_DIGI_ACCELEPORT)	+= digi_acceleport.o
obj-$(CONFIG_USB_SERIAL_EDGEPORT)		+= io_edgeport.o
obj-$(CONFIG_USB_SERIAL_EDGEPORT_TI)		+= io_ti.o
obj-$(CONFIG_USB_SERIAL_EMPEG)			+= empeg.o
obj-$(CONFIG_USB_SERIAL_FTDI_SIO)		+= ftdi_sio.o
obj-$(CONFIG_USB_SERIAL_FUNSOFT)		+= funsoft.o
obj-$(CONFIG_USB_SERIAL_GARMIN)			+= garmin_gps.o
obj-$(CONFIG_USB_SERIAL_HP4X)			+= hp4x.o
obj-$(CONFIG_USB_SERIAL_IPAQ)			+= ipaq.o
obj-$(CONFIG_USB_SERIAL_IPW)			+= ipw.o
obj-$(CONFIG_USB_SERIAL_IR)			+= ir-usb.o
obj-$(CONFIG_USB_SERIAL_IUU)			+= iuu_phoenix.o
obj-$(CONFIG_USB_SERIAL_KEYSPAN)		+= keyspan.o
obj-$(CONFIG_USB_SERIAL_KEYSPAN_PDA)		+= keyspan_pda.o
obj-$(CONFIG_USB_SERIAL_KLSI)			+= kl5kusb105.o
obj-$(CONFIG_USB_SERIAL_KOBIL_SCT)		+= kobil_sct.o
obj-$(CONFIG_USB_SERIAL_MCT_U232)		+= mct_u232.o
obj-$(CONFIG_USB_SERIAL_MOS7720)		+= mos7720.o
obj-$(CONFIG_USB_SERIAL_MOS7840)		+= mos7840.o
obj-$(CONFIG_USB_SERIAL_MOTOROLA)		+= moto_modem.o
obj-$(CONFIG_USB_SERIAL_NAVMAN)			+= navman.o
obj-$(CONFIG_USB_SERIAL_OMNINET)		+= omninet.o
obj-$(CONFIG_USB_SERIAL_OPTICON)		+= opticon.o
obj-$(CONFIG_USB_SERIAL_OPTION)			+= option.o
obj-$(CONFIG_USB_SERIAL_OTI6858)		+= oti6858.o
obj-$(CONFIG_USB_SERIAL_PL2303)			+= pl2303.o
obj-$(CONFIG_USB_SERIAL_SAFE)			+= safe_serial.o
obj-$(CONFIG_USB_SERIAL_SIEMENS_MPI)		+= siemens_mpi.o
obj-$(CONFIG_USB_SERIAL_SIERRAWIRELESS)		+= sierra.o
obj-$(CONFIG_USB_SERIAL_SPCP8X5)		+= spcp8x5.o
obj-$(CONFIG_USB_SERIAL_TI)			+= ti_usb_3410_5052.o
obj-$(CONFIG_USB_SERIAL_VISOR)			+= visor.o
obj-$(CONFIG_USB_SERIAL_WHITEHEAT)		+= whiteheat.o
obj-$(CONFIG_USB_SERIAL_XIRCOM)			+= keyspan_pda.o
