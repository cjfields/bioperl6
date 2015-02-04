.PHONY: all build test install clean distclean purge

PERL6  = perl6
DESTDIR= 
PREFIX = /Users/cjfields/.perl6/languages/perl6/site
BLIB   = blib
P6LIB  = $(PWD)/$(BLIB)/lib:$(PWD)/lib:$(PERL6LIB)
CP     = cp -p
MKDIR  = mkdir -p


BLIB_COMPILED = $(BLIB)/lib/Bio/Annotation/SimpleValue.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Actions/Default.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Fasta.pm6.moarvm $(BLIB)/lib/Bio/Grammar/FTLocation.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Genbank.pm6.moarvm $(BLIB)/lib/Bio/Location/Simple.pm6.moarvm $(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm $(BLIB)/lib/Bio/Role/Aliased.pm6.moarvm $(BLIB)/lib/Bio/Role/Annotatable.pm6.moarvm $(BLIB)/lib/Bio/Role/Describable.pm6.moarvm $(BLIB)/lib/Bio/Role/Identifiable.pm6.moarvm $(BLIB)/lib/Bio/Role/IO.pm6.moarvm $(BLIB)/lib/Bio/Role/Location.pm6.moarvm $(BLIB)/lib/Bio/Role/Pluggable.pm6.moarvm $(BLIB)/lib/Bio/Role/PrimarySeq.pm6.moarvm $(BLIB)/lib/Bio/Role/Range.pm6.moarvm $(BLIB)/lib/Bio/Role/RecordFormat.pm6.moarvm $(BLIB)/lib/Bio/Role/SeqStream.pm6.moarvm $(BLIB)/lib/Bio/Role/Temp.pm6.moarvm $(BLIB)/lib/Bio/Root/Root.pm6.moarvm $(BLIB)/lib/Bio/SeqIO/fasta.pm6.moarvm $(BLIB)/lib/Bio/SeqIO.pm6.moarvm $(BLIB)/lib/Bio/Tools/CodonTable.pm6.moarvm $(BLIB)/lib/Bio/Tools/FTLocationParser.pm6.moarvm $(BLIB)/lib/Bio/Tools/IUPAC.pm6.moarvm $(BLIB)/lib/Bio/Type/Location.pm6.moarvm $(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm

all build: $(BLIB_COMPILED)

$(BLIB)/lib/Bio/Annotation/SimpleValue.pm6.moarvm : lib/Bio/Annotation/SimpleValue.pm6 $(BLIB)/lib/Bio/Role/Annotatable.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Annotation/
	$(CP) lib/Bio/Annotation/SimpleValue.pm6 $(BLIB)/lib/Bio/Annotation/SimpleValue.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Annotation/SimpleValue.pm6.moarvm lib/Bio/Annotation/SimpleValue.pm6

$(BLIB)/lib/Bio/Grammar/Actions/Default.pm6.moarvm : lib/Bio/Grammar/Actions/Default.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/Actions/
	$(CP) lib/Bio/Grammar/Actions/Default.pm6 $(BLIB)/lib/Bio/Grammar/Actions/Default.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/Actions/Default.pm6.moarvm lib/Bio/Grammar/Actions/Default.pm6

$(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6.moarvm : lib/Bio/Grammar/Actions/Fasta.pm6 $(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/Actions/
	$(CP) lib/Bio/Grammar/Actions/Fasta.pm6 $(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6.moarvm lib/Bio/Grammar/Actions/Fasta.pm6

$(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6.moarvm : lib/Bio/Grammar/Actions/SeqDumper.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/Actions/
	$(CP) lib/Bio/Grammar/Actions/SeqDumper.pm6 $(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6.moarvm lib/Bio/Grammar/Actions/SeqDumper.pm6

$(BLIB)/lib/Bio/Grammar/Fasta.pm6.moarvm : lib/Bio/Grammar/Fasta.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/
	$(CP) lib/Bio/Grammar/Fasta.pm6 $(BLIB)/lib/Bio/Grammar/Fasta.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/Fasta.pm6.moarvm lib/Bio/Grammar/Fasta.pm6

$(BLIB)/lib/Bio/Grammar/FTLocation.pm6.moarvm : lib/Bio/Grammar/FTLocation.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/
	$(CP) lib/Bio/Grammar/FTLocation.pm6 $(BLIB)/lib/Bio/Grammar/FTLocation.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/FTLocation.pm6.moarvm lib/Bio/Grammar/FTLocation.pm6

$(BLIB)/lib/Bio/Grammar/Genbank.pm6.moarvm : lib/Bio/Grammar/Genbank.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Grammar/
	$(CP) lib/Bio/Grammar/Genbank.pm6 $(BLIB)/lib/Bio/Grammar/Genbank.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Grammar/Genbank.pm6.moarvm lib/Bio/Grammar/Genbank.pm6

$(BLIB)/lib/Bio/Location/Simple.pm6.moarvm : lib/Bio/Location/Simple.pm6 $(BLIB)/lib/Bio/Role/Location.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Location/
	$(CP) lib/Bio/Location/Simple.pm6 $(BLIB)/lib/Bio/Location/Simple.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Location/Simple.pm6.moarvm lib/Bio/Location/Simple.pm6

$(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm : lib/Bio/PrimarySeq.pm6 $(BLIB)/lib/Bio/Role/Describable.pm6.moarvm $(BLIB)/lib/Bio/Role/Identifiable.pm6.moarvm $(BLIB)/lib/Bio/Role/PrimarySeq.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/
	$(CP) lib/Bio/PrimarySeq.pm6 $(BLIB)/lib/Bio/PrimarySeq.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm lib/Bio/PrimarySeq.pm6

$(BLIB)/lib/Bio/Role/Aliased.pm6.moarvm : lib/Bio/Role/Aliased.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Aliased.pm6 $(BLIB)/lib/Bio/Role/Aliased.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Aliased.pm6.moarvm lib/Bio/Role/Aliased.pm6

$(BLIB)/lib/Bio/Role/Annotatable.pm6.moarvm : lib/Bio/Role/Annotatable.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Annotatable.pm6 $(BLIB)/lib/Bio/Role/Annotatable.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Annotatable.pm6.moarvm lib/Bio/Role/Annotatable.pm6

$(BLIB)/lib/Bio/Role/Describable.pm6.moarvm : lib/Bio/Role/Describable.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Describable.pm6 $(BLIB)/lib/Bio/Role/Describable.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Describable.pm6.moarvm lib/Bio/Role/Describable.pm6

$(BLIB)/lib/Bio/Role/Identifiable.pm6.moarvm : lib/Bio/Role/Identifiable.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Identifiable.pm6 $(BLIB)/lib/Bio/Role/Identifiable.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Identifiable.pm6.moarvm lib/Bio/Role/Identifiable.pm6

$(BLIB)/lib/Bio/Role/IO.pm6.moarvm : lib/Bio/Role/IO.pm6 $(BLIB)/lib/Bio/Role/Temp.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/IO.pm6 $(BLIB)/lib/Bio/Role/IO.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/IO.pm6.moarvm lib/Bio/Role/IO.pm6

$(BLIB)/lib/Bio/Role/Location.pm6.moarvm : lib/Bio/Role/Location.pm6 $(BLIB)/lib/Bio/Role/Range.pm6.moarvm $(BLIB)/lib/Bio/Type/Location.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Location.pm6 $(BLIB)/lib/Bio/Role/Location.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Location.pm6.moarvm lib/Bio/Role/Location.pm6

$(BLIB)/lib/Bio/Role/Pluggable.pm6.moarvm : lib/Bio/Role/Pluggable.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Pluggable.pm6 $(BLIB)/lib/Bio/Role/Pluggable.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Pluggable.pm6.moarvm lib/Bio/Role/Pluggable.pm6

$(BLIB)/lib/Bio/Role/PrimarySeq.pm6.moarvm : lib/Bio/Role/PrimarySeq.pm6 $(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm $(BLIB)/lib/Bio/Tools/CodonTable.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/PrimarySeq.pm6 $(BLIB)/lib/Bio/Role/PrimarySeq.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/PrimarySeq.pm6.moarvm lib/Bio/Role/PrimarySeq.pm6

$(BLIB)/lib/Bio/Role/Range.pm6.moarvm : lib/Bio/Role/Range.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Range.pm6 $(BLIB)/lib/Bio/Role/Range.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Range.pm6.moarvm lib/Bio/Role/Range.pm6

$(BLIB)/lib/Bio/Role/RecordFormat.pm6.moarvm : lib/Bio/Role/RecordFormat.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/RecordFormat.pm6 $(BLIB)/lib/Bio/Role/RecordFormat.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/RecordFormat.pm6.moarvm lib/Bio/Role/RecordFormat.pm6

$(BLIB)/lib/Bio/Role/SeqStream.pm6.moarvm : lib/Bio/Role/SeqStream.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/SeqStream.pm6 $(BLIB)/lib/Bio/Role/SeqStream.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/SeqStream.pm6.moarvm lib/Bio/Role/SeqStream.pm6

$(BLIB)/lib/Bio/Role/Temp.pm6.moarvm : lib/Bio/Role/Temp.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Role/
	$(CP) lib/Bio/Role/Temp.pm6 $(BLIB)/lib/Bio/Role/Temp.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Role/Temp.pm6.moarvm lib/Bio/Role/Temp.pm6

$(BLIB)/lib/Bio/Root/Root.pm6.moarvm : lib/Bio/Root/Root.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Root/
	$(CP) lib/Bio/Root/Root.pm6 $(BLIB)/lib/Bio/Root/Root.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Root/Root.pm6.moarvm lib/Bio/Root/Root.pm6

$(BLIB)/lib/Bio/SeqIO/fasta.pm6.moarvm : lib/Bio/SeqIO/fasta.pm6 $(BLIB)/lib/Bio/Role/SeqStream.pm6.moarvm $(BLIB)/lib/Bio/Grammar/Fasta.pm6.moarvm $(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/SeqIO/
	$(CP) lib/Bio/SeqIO/fasta.pm6 $(BLIB)/lib/Bio/SeqIO/fasta.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/SeqIO/fasta.pm6.moarvm lib/Bio/SeqIO/fasta.pm6

$(BLIB)/lib/Bio/SeqIO.pm6.moarvm : lib/Bio/SeqIO.pm6 $(BLIB)/lib/Bio/Role/Pluggable.pm6.moarvm $(BLIB)/lib/Bio/Role/RecordFormat.pm6.moarvm $(BLIB)/lib/Bio/Role/IO.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/
	$(CP) lib/Bio/SeqIO.pm6 $(BLIB)/lib/Bio/SeqIO.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/SeqIO.pm6.moarvm lib/Bio/SeqIO.pm6

$(BLIB)/lib/Bio/Tools/CodonTable.pm6.moarvm : lib/Bio/Tools/CodonTable.pm6 $(BLIB)/lib/Bio/Tools/IUPAC.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Tools/
	$(CP) lib/Bio/Tools/CodonTable.pm6 $(BLIB)/lib/Bio/Tools/CodonTable.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Tools/CodonTable.pm6.moarvm lib/Bio/Tools/CodonTable.pm6

$(BLIB)/lib/Bio/Tools/FTLocationParser.pm6.moarvm : lib/Bio/Tools/FTLocationParser.pm6 $(BLIB)/lib/Bio/Grammar/FTLocation.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Tools/
	$(CP) lib/Bio/Tools/FTLocationParser.pm6 $(BLIB)/lib/Bio/Tools/FTLocationParser.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Tools/FTLocationParser.pm6.moarvm lib/Bio/Tools/FTLocationParser.pm6

$(BLIB)/lib/Bio/Tools/IUPAC.pm6.moarvm : lib/Bio/Tools/IUPAC.pm6 $(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm
	$(MKDIR) $(BLIB)/lib/Bio/Tools/
	$(CP) lib/Bio/Tools/IUPAC.pm6 $(BLIB)/lib/Bio/Tools/IUPAC.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Tools/IUPAC.pm6.moarvm lib/Bio/Tools/IUPAC.pm6

$(BLIB)/lib/Bio/Type/Location.pm6.moarvm : lib/Bio/Type/Location.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Type/
	$(CP) lib/Bio/Type/Location.pm6 $(BLIB)/lib/Bio/Type/Location.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Type/Location.pm6.moarvm lib/Bio/Type/Location.pm6

$(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm : lib/Bio/Type/Sequence.pm6
	$(MKDIR) $(BLIB)/lib/Bio/Type/
	$(CP) lib/Bio/Type/Sequence.pm6 $(BLIB)/lib/Bio/Type/Sequence.pm6
	PERL6LIB=$(P6LIB) $(PERL6) --target=mbc --output=$(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm lib/Bio/Type/Sequence.pm6


test: build
	env PERL6LIB=$(P6LIB) prove -e '$(PERL6)' -r t/

loudtest: build
	env PERL6LIB=$(P6LIB) prove -ve '$(PERL6)' -r t/

timetest: build
	env PERL6LIB=$(P6LIB) PERL6_TEST_TIMES=1 prove -ve '$(PERL6)' -r t/

install: $(BLIB_COMPILED)
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Annotation/
	$(CP) $(BLIB)/lib/Bio/Annotation/SimpleValue.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Annotation/SimpleValue.pm6
	$(CP) $(BLIB)/lib/Bio/Annotation/SimpleValue.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Annotation/SimpleValue.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/Default.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/Default.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/Default.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/Default.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/Fasta.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/Fasta.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/Fasta.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/SeqDumper.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/Actions/SeqDumper.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Actions/SeqDumper.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/
	$(CP) $(BLIB)/lib/Bio/Grammar/Fasta.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Fasta.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/Fasta.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Fasta.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/
	$(CP) $(BLIB)/lib/Bio/Grammar/FTLocation.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/FTLocation.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/FTLocation.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/FTLocation.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/
	$(CP) $(BLIB)/lib/Bio/Grammar/Genbank.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Genbank.pm6
	$(CP) $(BLIB)/lib/Bio/Grammar/Genbank.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Grammar/Genbank.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Location/
	$(CP) $(BLIB)/lib/Bio/Location/Simple.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Location/Simple.pm6
	$(CP) $(BLIB)/lib/Bio/Location/Simple.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Location/Simple.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/
	$(CP) $(BLIB)/lib/Bio/PrimarySeq.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/PrimarySeq.pm6
	$(CP) $(BLIB)/lib/Bio/PrimarySeq.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/PrimarySeq.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Aliased.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Aliased.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Aliased.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Aliased.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Annotatable.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Annotatable.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Annotatable.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Annotatable.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Describable.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Describable.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Describable.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Describable.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Identifiable.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Identifiable.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Identifiable.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Identifiable.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/IO.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/IO.pm6
	$(CP) $(BLIB)/lib/Bio/Role/IO.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/IO.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Location.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Location.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Location.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Location.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Pluggable.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Pluggable.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Pluggable.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Pluggable.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/PrimarySeq.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/PrimarySeq.pm6
	$(CP) $(BLIB)/lib/Bio/Role/PrimarySeq.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/PrimarySeq.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Range.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Range.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Range.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Range.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/RecordFormat.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/RecordFormat.pm6
	$(CP) $(BLIB)/lib/Bio/Role/RecordFormat.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/RecordFormat.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/SeqStream.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/SeqStream.pm6
	$(CP) $(BLIB)/lib/Bio/Role/SeqStream.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/SeqStream.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Role/
	$(CP) $(BLIB)/lib/Bio/Role/Temp.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Role/Temp.pm6
	$(CP) $(BLIB)/lib/Bio/Role/Temp.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Role/Temp.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Root/
	$(CP) $(BLIB)/lib/Bio/Root/Root.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Root/Root.pm6
	$(CP) $(BLIB)/lib/Bio/Root/Root.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Root/Root.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/SeqIO/
	$(CP) $(BLIB)/lib/Bio/SeqIO/fasta.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/SeqIO/fasta.pm6
	$(CP) $(BLIB)/lib/Bio/SeqIO/fasta.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/SeqIO/fasta.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/
	$(CP) $(BLIB)/lib/Bio/SeqIO.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/SeqIO.pm6
	$(CP) $(BLIB)/lib/Bio/SeqIO.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/SeqIO.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Tools/
	$(CP) $(BLIB)/lib/Bio/Tools/CodonTable.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Tools/CodonTable.pm6
	$(CP) $(BLIB)/lib/Bio/Tools/CodonTable.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Tools/CodonTable.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Tools/
	$(CP) $(BLIB)/lib/Bio/Tools/FTLocationParser.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Tools/FTLocationParser.pm6
	$(CP) $(BLIB)/lib/Bio/Tools/FTLocationParser.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Tools/FTLocationParser.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Tools/
	$(CP) $(BLIB)/lib/Bio/Tools/IUPAC.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Tools/IUPAC.pm6
	$(CP) $(BLIB)/lib/Bio/Tools/IUPAC.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Tools/IUPAC.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Type/
	$(CP) $(BLIB)/lib/Bio/Type/Location.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Type/Location.pm6
	$(CP) $(BLIB)/lib/Bio/Type/Location.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Type/Location.pm6.moarvm
	$(MKDIR) $(DESTDIR)$(PREFIX)/lib/Bio/Type/
	$(CP) $(BLIB)/lib/Bio/Type/Sequence.pm6 $(DESTDIR)$(PREFIX)/lib/Bio/Type/Sequence.pm6
	$(CP) $(BLIB)/lib/Bio/Type/Sequence.pm6.moarvm $(DESTDIR)$(PREFIX)/lib/Bio/Type/Sequence.pm6.moarvm


clean:
	rm -fr $(BLIB)

distclean purge: clean
	rm -r Makefile
