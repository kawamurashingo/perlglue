use strict;
use warnings;
use Test::More;

my $perlglue = "$^X -Ilib bin/perlglue";

my $upper = `echo perl | $perlglue upper`;
is($upper, "PERL\n", 'upper command works');

my $lower = `echo PERL | $perlglue lower`;
is($lower, "perl\n", 'lower command works');

done_testing;
