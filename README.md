# BioPerl 6 

The experimental classes in this directory are test implementations for Perl 6.
Most of these are similar to perl5-based BioPerl with simple Perl 6
translations. We intend on porting functionality when needed, but also
addressing many of the problems faced with the perl5 BioPerl version, namely
class/interface structure, overly complex class hierarchy, etc.  

So, keep in mind that nothing is set in stone yet and things may change under
your feet. **Hic sunt dracones**. 

# Participation

If you have an itech to scratch and want to try it out, fork the code and hack
away. Even better, *I can add you as a developer!*  Drop me a note, I'm more than
happy to have help.

# Targeting

Currently, I am targeting [Rakudo Perl 6](https://github.com/rakudo/rakudo)
(specifically using the MoarVM backend) off the `nom` branch. We may switch at
some point to a targeted Rakudo Star version for more stability, but since the
latest branch code has seen dramatic improvements (as of Aug. 2014) we aim to
stay consistent with that.

We also will try to support other backends where feasible (namely meaning that
changes will not require working around features not implemented in said
backend).

# Implemented

* `Bio::PrimarySeq` - this includes required modules for transcription and
  translation.
* `Bio::Range` - simple biological range operations (don't confuse this with the
  Perl 6 Range class)
* `Bio::Root` - original base class for BioPerl, though this may be removed in
  favor of using Perl 6 standard exception handling (which is leagues better
  than p5)

# Testing

Basically, one can do this:

```
prove -e 'perl6' -r t
``` 

which will run all tests. **This will certainly fail at this stage!** Most
current tests are ports from the original BioPerl distribution, and the current
code is in various stages of updating. We aniticipate this changing more over
the next year.

To run a single test:

```
prove -e 'perl6' t/Root.
``` 

I also have a simple `Makefile` that can be used to precompile some modules.
This is essentially a legacy of the older method for testing code, back when
tests would take a long time to run. This is less of an issue now, but
precompilation **does** speed things up.

# Notes

Perl 6 is a specification and thus can represent multiple implementations. More
in the Perl 6 [synopses](http://feather.perl6.nl/syn/).
