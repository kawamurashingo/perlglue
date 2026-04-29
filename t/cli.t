use strict;
use warnings;
use Test::More;

my $perlglue = "$^X -Ilib bin/perlglue";

my $out = `$perlglue version`;
like($out, qr/^perlglue 0\.02/, 'perlglue version works');

my $upper = `echo perl | $perlglue upper`;
is($upper, "PERL\n", 'upper command works');

my $lower = `echo PERL | $perlglue lower`;
is($lower, "perl\n", 'lower command works');

my $tmp = "t/.tmp_users.csv";
open my $fh, '>', $tmp or die $!;
print {$fh} "name,email,age\nAlice,a\@example.com,31\nBob,b\@example.com,20\n";
close $fh;

my $pick = `$perlglue pick $tmp --csv name,email`;
like($pick, qr/^name,email\nAlice,a\@example.com\nBob,b\@example.com/m, 'pick csv works');

my $jsonl = `$perlglue convert $tmp --to jsonl`;
like($jsonl, qr/"name":"Alice"/, 'convert csv to jsonl works');

my $where = `printf 'ok\nERROR timeout\n' | $perlglue lines --where '\$_ =~ /ERROR/'`;
is($where, "ERROR timeout\n", 'lines --where works');

unlink $tmp;

done_testing;
