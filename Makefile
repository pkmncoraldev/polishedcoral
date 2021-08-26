NAME := coral
VERSION := in-progress

TITLE := POKECORALV1
MCODE := PKCV
ROMVERSION := 0x30

FILLER = 0x00

ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

RGBASM_FLAGS = -Weverything
RGBLINK_FLAGS = -n $(ROM_NAME).sym -m $(ROM_NAME).map -l contents/contents.link -p $(FILLER)
RGBFIX_FLAGS = -csjv -t $(TITLE) -i $(MCODE) -n $(ROMVERSION) -p $(FILLER) -k 01 -l 0x33 -m 0x10 -r 3

CFLAGS = -g -O3 -march=native -std=c11 -Wall -Wextra -pedantic

ifeq ($(filter faithful,$(MAKECMDGOALS)),faithful)
RGBASM_FLAGS += -DFAITHFUL
endif
ifeq ($(filter nortc,$(MAKECMDGOALS)),nortc)
RGBASM_FLAGS += -DNO_RTC
endif
ifeq ($(filter monochrome,$(MAKECMDGOALS)),monochrome)
RGBASM_FLAGS += -DMONOCHROME
endif
ifeq ($(filter noir,$(MAKECMDGOALS)),noir)
RGBASM_FLAGS += -DNOIR
endif
ifeq ($(filter hgss,$(MAKECMDGOALS)),hgss)
RGBASM_FLAGS += -DHGSS
endif
ifeq ($(filter debug,$(MAKECMDGOALS)),debug)
RGBASM_FLAGS += -DDEBUG
endif


.SUFFIXES:
.PHONY: all clean crystal faithful nortc debug monochrome bankfree freespace compare tools
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp %.lz %.o


roms_md5      = roms.md5
bank_ends_txt = contents/bank_ends.txt
sorted_sym    = contents/$(NAME).sym

PYTHON = python2
CC     = gcc
RM     = rm -f
GFX    = $(PYTHON) gfx.py
MD5    = md5sum

LZ            = tools/lzcomp
SCAN_INCLUDES = tools/scan_includes

bank_ends := $(PYTHON) contents/bank_ends.py $(NAME)-$(VERSION)


crystal_obj := \
main.o \
home.o \
ram.o \
audio.o \
audio/musicplayer.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
data/maps/map_data.o \
data/text/common.o \
data/tilesets.o \
engine/credits.o \
engine/events.o \
gfx/pics.o \
gfx/sprites.o


all: crystal

crystal: FILLER = 0x00
crystal: ROM_NAME = $(NAME)-$(VERSION)
crystal: $(NAME)-$(VERSION).gbc

faithful: crystal
nortc: crystal
monochrome: crystal
noir: crystal
hgss: crystal
debug: crystal

bankfree: FILLER = 0xff
bankfree: ROM_NAME = $(NAME)-$(VERSION)-0xff
bankfree: $(NAME)-$(VERSION)-0xff.gbc

freespace: $(bank_ends_txt) $(roms_md5) $(sorted_sym)


# Build tools when building the rom
ifeq ($(filter clean tools,$(MAKECMDGOALS)),)
Makefile: tools
endif

tools: $(LZ) $(SCAN_INCLUDES)

$(LZ): $(wildcard tools/lz/*.c) $(wildcard tools/lz/*.h)
	$(CC) $(CFLAGS) -flto -o $@ tools/lz/*.c

$(SCAN_INCLUDES): $(SCAN_INCLUDES).c
	$(CC) $(CFLAGS) -o $@ $<


clean:
	$(RM) $(crystal_obj) $(wildcard $(NAME)-*.gbc) $(wildcard $(NAME)-*.map) $(wildcard $(NAME)-*.sym)

compare: crystal
	$(MD5) -c $(roms_md5)


$(bank_ends_txt): crystal bankfree ; $(bank_ends) > $@
$(roms_md5): crystal ; $(MD5) $(NAME)-$(VERSION).gbc > $@
$(sorted_sym): crystal ; tail -n +3 $(NAME)-$(VERSION).sym | sort -o $@



# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
endef

ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))
# Dependencies for shared objects objects
$(foreach obj, $(crystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))
endif

%.o: %.asm

	$(RGBDS_DIR)rgbasm $(RGBASM_FLAGS) -o $@ $<

.gbc:
%.gbc: $(crystal_obj)
	$(RGBDS_DIR)rgblink $(RGBLINK_FLAGS) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_FLAGS) $@

%.2bpp.vram0: %.2bpp
	tools/sub_2bpp.sh $< 128 > $@

%.2bpp.vram1: %.2bpp
	tools/sub_2bpp.sh $< 128 128 > $@

%.2bpp.vram2: %.2bpp
	tools/sub_2bpp.sh $< 256 128 > $@
	
%.2bpp: %.png ; $(GFX) 2bpp $<
%.1bpp: %.png ; $(GFX) 1bpp $<

gfx/pokemon/%/bitmask.asm gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.2bpp

%.lz: % ; $(LZ) $< $@

%.pal: ; $(error ERROR: Cannot find '$@')
%.png: ; $(error ERROR: Cannot find '$@')
%.asm: ; $(error ERROR: Cannot find '$@')
%.bin: ; $(error ERROR: Cannot find '$@')
%.ablk: ; $(error ERROR: Cannot find '$@')
%.tilemap: ; $(error ERROR: Cannot find '$@')

#%.wav: ;
#%.ded: %.wav dedenc.py ; $(PYTHON) dedenc.py $< $@
