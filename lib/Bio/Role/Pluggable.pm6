use v6;

# This is a stripped-down variation of:
# https://github.com/tony-o/perl6-pluggable/blob/master/lib/Pluggable.pm6
# but parametric and shallow (no recursion)

# TODO: Do we override the Pluggable role or use our own? Going with our own,
# but it might be nice to use the role...

role Bio::Role::Pluggable[Str $pd] # does Pluggable
{
    has $!plugin-dir  = $pd;
    
    method plugins(){
        my @list;
        my $class = "{::?CLASS.^name}";
        $class   ~~ s:g/'::'/\//;
        my $plugin = $!plugin-dir;
        for (@*INC) -> $dir, {
            try {
                my Str $start = "{$dir.Str.IO.path}/$class/$plugin".IO.absolute;
                for self!search($start, base => $start.chars + 1, baseclass => "{$class}::{$plugin}::") -> $t {
                    try {
                        my $m = $t;
                        $m ~~ s:g/\//::/;
                        require ::("$m");
                        @list.push($m);
                    };
                }
            }
        };
        return @list;
    }
  
    method !search(Str $dir, :$baseclass, :$base){ 
        my @r;
        for dir($dir) -> $f {
            next unless $f.IO ~~ :f;
            my $modulename = $f.absolute.Str.\
                                substr($base).\
                                subst(/ '.pm6' $ /, '');
            $modulename   ~~ s:g/ [ '/' | '\\' ] /::/;
            @r.push("$baseclass$modulename") if $f.IO ~~ :f && $f.basename.match(/ '.pm6' $ /);
        }
        return @r;
    }
}
 
