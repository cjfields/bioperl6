use v6;

# This is a stripped-down variation of:
# https://github.com/tony-o/perl6-pluggable/blob/master/lib/Pluggable.pm6
# but parametric and shallow (no recursion)

# TODO: Do we override the Pluggable role or use our own? Going with our own
# since we make this parameterizable, but it might be nice to use the role...

role Bio::Role::Pluggable[Str $pd] # does Pluggable
{
    has $!plugin-dir  = $pd;
    
    method plugins(:$module) {
        my @list;
        # if a specific module is passed, check that namespace, otherwise use current class name    
        my $class = "{$module.defined ?? $module !! ::?CLASS.^name}";
        # convert to path, probably should use spec here
        $class   ~~ s:g/'::'/\//;
        
        my $plugin = $!plugin-dir;

        # note this is searching all paths, not needed if a path is given
        for ($*REPO) -> $dir {
            my Str $start = "{$dir.Str}/$class/$!plugin-dir";
            if $start.IO.d {
                for self!search($start, base => $start.chars + 1, baseclass => "{$class}::{$!plugin-dir}::") -> $t {
                    my $m = $t;
                    $m ~~ s:g/\//::/;
                    require ::("$m");
                    @list.push($m);
                }
            }
        }
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
 
