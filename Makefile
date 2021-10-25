# Make on-all.

PROG = on-all

VersionNumber := $(shell grep ^VersionNumber $(PROG) | sed 's/.*=//')
VersionDate   := $(shell grep ^VersionDate   $(PROG) | sed 's/.*=//')

.PHONY: all
all: man pdf

.PHONY: man
man: $(PROG).1
$(PROG).1: $(PROG).pod
	pod2man -r $(VersionNumber) -d $(VersionDate) -c "User commands" $< $@
pdf: $(PROG).pdf
$(PROG).pdf: $(PROG).1
	man -t ./$< | ps2pdf - - > $@

.PHONY: clean
clean:
	rm -f $(PROG).1 $(PROG).pdf
