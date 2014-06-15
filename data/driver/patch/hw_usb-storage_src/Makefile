#
# Makefile for the USB Mass Storage device drivers.
#
# 15 Aug 2000, Christoph Hellwig <hch@infradead.org>
# Rewritten to use lists instead of if-statements.
#

all: clean modules install

modules:
	$(MAKE) -C src/ modules

clean:
	$(MAKE) -C src/ clean

install:
	$(MAKE) -C src/ install
