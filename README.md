# App::PerlGlue

`App::PerlGlue` provides the `perlglue` command: tiny text-processing glue for the shell.

## Install from source

```sh
perl Makefile.PL
make
make test
make install
```

## Try it locally

```sh
echo 'Perl is glue' | perl -Ilib bin/perlglue upper
echo 'TEXT' | perl -Ilib bin/perlglue lower
```

## Commands

```text
perlglue help
perlglue version
perlglue upper < input.txt
perlglue lower < input.txt
```

## Roadmap

- `grep-json` — filter JSON Lines
- `csv-to-json` — convert CSV to JSON Lines
- `json-to-csv` — convert JSON Lines to CSV
- `extract-url` — extract URLs from text
- `rename` — batch rename files with Perl regexes

## License

Same terms as Perl itself.
