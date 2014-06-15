all: mkcdrom

mkcdrom: cdrom/Linux/data.bin

DATA_MD5SUM = $(shell tar -cf - data | md5sum >.data_md5sum.new && \
	{ cmp .data_md5sum.new .data_md5sum || mv .data_md5sum.new .data_md5sum; } && \
	rm -f .data_md5sum.new && echo .data_md5sum || echo .data_md5sum.bad )

cdrom/Linux/data.bin: $(DATA_MD5SUM)
	rm -f cdrom/Linux/data.bin
	bash -c 'cd data && shopt -s dotglob nullglob && ../cdrom/Linux/7zr u ../cdrom/Linux/data.bin *'

