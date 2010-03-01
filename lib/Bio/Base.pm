# all common subsets, enums, here

subset Bio::Strand of Int where { $_ == 0 | 1 | -1 };

enum Day <Mon Tue Wed Thu Fri Sat Sun>;
