use v6;

role Bio::Role::RecordFormat;

has $.format;

has $.format-variant;

has $.format-version;

method guess-format { ... }
