use strict;
use warnings;
use Test::More;

my $cmd = "$^X -Ilib bin/perlglue version";
my $out = `$cmd`;
like($out, qr/^perlglue 0\.01/, 'perlglue version works');

my $upper = `echo perl | $^X -Ilib bin/perlglue upper`;
is($upper, "PERL\n", 'upper command works');

my $lower = `echo PERL | $^X -Ilib bin/perlglue lower`;
is($lower, "perl\n", 'lower command works');

done_testing;
