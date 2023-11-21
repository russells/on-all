# Make on-all.

SRC = on-all.sh
PROG = on-all

VersionNumber := $(shell grep ^VersionNumber $(SRC) | sed 's/.*=//')
VersionDate   := $(shell grep ^VersionDate   $(SRC) | sed 's/.*=//')

.PHONY: all
all: $(PROG) man pdf

.PHONY: shellcheck
# SC2268 (style): Avoid x-prefix in comparisons
# SC2181 (style): Check exit code directly
shellcheck:
	shellcheck -e SC2268,SC2181 on-all

$(PROG): $(SRC) Makefile
	cp $(SRC) $(PROG)
	chmod +x $(PROG)

.PHONY: install
install: $(PROG) man
	install -d ~/bin
	install -m 755 -t ~/bin $(PROG)
	install -d ~/share/man/man1
	install -m 644 -t ~/share/man/man1 $(PROG).1

.PHONY: man
man: $(PROG).1
$(PROG).1: $(PROG).pod
	pod2man -r $(VersionNumber) -d $(VersionDate) -c "User commands" $< $@
pdf: $(PROG).pdf
$(PROG).pdf: $(PROG).1
	man -t ./$< | ps2pdf - - > $@ ; \
	if [ `stat -c %s $@` -eq 0 ] ; then rm -f $@ ; false ; else true ; fi

.PHONY: clean
clean:
	rm -f $(PROG).1 $(PROG).pdf
