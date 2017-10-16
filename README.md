[![Build Status](https://travis-ci.org/cjfields/bioperl6.svg?branch=master)](https://travis-ci.org/cjfields/bioperl6)

# BioPerl 6

The experimental classes in this directory are test implementations for Perl 6.
Most of these are similar to perl5-based BioPerl with simple Perl 6
translations. We intend on porting functionality when needed, but also
addressing many of the problems faced with the perl5 BioPerl version, namely
class/interface structure, overly complex class hierarchy, etc.  

So, keep in mind that nothing is set in stone yet and things may change under
your feet. **Hic sunt dracones**.

Also, just a note: this repository may eventually be moved under the BioPerl
umbrella.  If so, I'll leave stub repo here pointing to the correct location.

# Participation

If you have an itch to scratch and want to try it out, fork the code and hack
away. Even better, *I can add you as a developer!*  Drop me a note, I'm more than
happy to have help.  The more the better!

# Targeting

Currently, I target [Rakudo Perl 6](https://github.com/rakudo/rakudo)
(specifically using the MoarVM backend) off the `nom` branch. We may switch at
some point to a targeted Rakudo Star version for more stability, but since the
latest branch code has seen dramatic improvements (as of Aug. 2014) we aim to
stay consistent with that.  

Note, as of Dec. 25, 2015, Rakudo is now targeting the newly-released Perl 6
official specification (6.c), therefore syntax is expected to have stabilized
and focus will be fixing bugs, improving performance, and working out corners of
the specification that need further clarification.

# Implemented

* `Bio::PrimarySeq` - this includes required basic modules for transcription and
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
code is in various stages of updating. We anticipate this changing more over
the next year.

To run a single test:

```
prove -e 'perl6' t/Root.t
```

# Notes

Perl 6 is a specification and thus can represent multiple implementations. More
in the Perl 6 [synopses](http://design.perl6.org/).

# Related

* [Matt Oates](http://blog.mattoates.co.uk) has some nice Perl6 bioinformatics code implemented in the [BioInfo project](https://github.com/MattOates/BioInfo) that demonstrates some of the power of Perl6, including slangs and concurrency.  
