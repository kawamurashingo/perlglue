use strict;
use warnings;
use Test::More;

my $perlglue = "$^X -Ilib bin/perlglue";

my $out = `$perlglue version`;
like($out, qr/^perlglue 0\.03/, 'perlglue version works');

my $help = `$perlglue upper --help`;
is($help, "perlglue upper < input.txt\n", 'subcommand --help works');

done_testing;
