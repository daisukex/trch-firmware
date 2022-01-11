
# Design Parameter
MODULE := trch-firmware
DEVICE := 16LF877
TARGET := PPK4

# Command variables
CC     := xc8-cc -mc90lib
IPECMD := ipecmd.sh
RM     := rm -rf

# File Path variables
INCDIR := src
HEXDIR := hex
PRGDAT := $(HEXDIR)/$(MODULE)

# Clean File
CF      = $(wildcard $(HEXDIR) MPLABXLog.* log.*)

vpath %.c   $(src)

.PHONY: all
all: program

.PHONY: build
build: $(PRGDAT).hex

$(PRGDAT).hex: $(INCDIR)/*.c
	@if [ ! -e $(HEXDIR) ]; then \
		mkdir $(HEXDIR); \
	fi
	$(CC) -mcpu=$(DEVICE) -I $(INCDIR) -o $(HEXDIR)/$(MODULE) $^

.PHONY: program
program: $(PRGDAT).hex
	$(IPECMD) -P$(DEVICE) -T$(TARGET) -F$< -M

.PHONY: erase
erase:
	$(IPECMD) -P$(DEVICE) -T$(TARGET) -E

.PHONY: clean
clean:
	$(RM) $(CF)
