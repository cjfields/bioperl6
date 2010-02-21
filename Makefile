PERL6=<PERL6>
RAKUDO_DIR=<RAKUDO_DIR>
PERL6LIB='<PERL6LIB>:$(RAKUDO_DIR)'

SOURCES=lib/Bio/Root/Root.pm \
        lib/Bio/RangeI.pm \
        lib/Bio/Range.pm

PIRS=$(SOURCES:.pm=.pir)

all: $(PIRS)

%.pir: %.pm
	env PERL6LIB=$(PERL6LIB) $(PERL6) --target=pir --output=$@ $<

clean:
	rm -f $(PIRS)

test: all
	env PERL6LIB=$(PERL6LIB) prove -e '$(PERL6)' -r --nocolor t/
