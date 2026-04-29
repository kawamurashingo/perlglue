package App::PerlGlue;

use strict;
use warnings;
use feature qw(say);

our $VERSION = '0.01';

sub run {
    my ($class, @argv) = @_;

    my $cmd = shift @argv // 'help';

    if ($cmd eq 'help' || $cmd eq '--help' || $cmd eq '-h') {
        return _help();
    }

    if ($cmd eq 'version' || $cmd eq '--version' || $cmd eq '-v') {
        say "perlglue $VERSION";
        return 0;
    }

    if ($cmd eq 'upper') {
        while (my $line = <STDIN>) {
            print uc $line;
        }
        return 0;
    }

    if ($cmd eq 'lower') {
        while (my $line = <STDIN>) {
            print lc $line;
        }
        return 0;
    }

    warn "Unknown command: $cmd\n\n";
    _help();
    return 2;
}

sub _help {
    print <<'HELP';
perlglue - tiny text-processing glue for the shell

Usage:
  perlglue help
  perlglue version
  perlglue upper < input.txt
  perlglue lower < input.txt

Commands:
  upper     Uppercase stdin
  lower     Lowercase stdin
  version   Show version
  help      Show this help

Examples:
  echo 'Perl is glue' | perlglue upper
  echo 'TEXT' | perlglue lower
HELP

    return 0;
}

1;

__END__

=head1 NAME

App::PerlGlue - tiny text-processing glue for the shell

=head1 SYNOPSIS

    echo 'Perl is glue' | perlglue upper
    echo 'TEXT' | perlglue lower

=head1 DESCRIPTION

App::PerlGlue provides a small C<perlglue> command for everyday shell text
processing. It is intended to grow into a practical collection of commands
that make common data munging jobs faster than reaching for a larger script.

=head1 COMMANDS

=head2 upper

Uppercase standard input.

=head2 lower

Lowercase standard input.

=head2 version

Print the installed version.

=head2 help

Print command help.

=head1 AUTHOR

Your Name <you@example.com>

=head1 LICENSE

This library is free software; you may redistribute it and/or modify it under
the same terms as Perl itself.

=cut
