PERL6=perl6
RAKUDO_DIR=<RAKUDO_DIR>
PERL6LIB='<PERL6LIB>:$(RAKUDO_DIR)'

SOURCES= ./Test.pm \
lib/Bio/Root/Root.pm 

PIRS=$(SOURCES:.pm=.pir)

all: $(PIRS)

%.pir: %.pm
	$(PERL6) --target=pir --output=$@ $<

clean:
	rm -f $(PIRS)

test: all
	prove -e '$(PERL6)' -r --nocolor t/
