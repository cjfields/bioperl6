PERL6=perl6
RAKUDO_DIR=<RAKUDO_DIR>

TARGET=jar

SOURCES= \
    ./lib/Bio/Root/Root.pm \
    ./lib/Bio/Grammar/Fasta.pm \
    ./lib/Bio/Role/Range.pm \
    ./lib/Bio/Role/Describe.pm \
    ./lib/Bio/Role/Identify.pm \
    ./lib/Bio/Tools/IUPAC.pm \
    ./lib/Bio/Tools/CodonTable.pm \
    ./lib/Bio/PrimarySeq.pm \
    ./lib/Bio/SeqIO.pm 

#    ./lib/Bio/Role/FastaIO.pm \

TARGETS=$(SOURCES:.pm=.${TARGET})

all: $(TARGETS)

%.jar: %.pm
	$(PERL6) --target=${TARGET} --output=$@ $<

clean:
	rm -f $(TARGETS)

test: all
	prove -e '$(PERL6)' -r --nocolor t/
