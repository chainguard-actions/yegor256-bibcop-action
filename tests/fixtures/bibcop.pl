#!/usr/bin/perl
# Fake bibcop.pl for testing purposes
# Checks that @article entries have required fields: author, title, journal, year, volume, number, pages

use strict;
use warnings;

my $file = $ARGV[-1];
die "No file specified\n" unless defined $file;

open(my $fh, '<', $file) or die "Cannot open $file: $!\n";
my $content = do { local $/; <$fh> };
close($fh);

my $errors = 0;

# Find all @article entries
while ($content =~ /\@article\s*\{([^,]+),([^@]*)\}/gs) {
    my $key = $1;
    my $body = $2;
    my @required = ('author', 'title', 'journal', 'year', 'volume', 'number', 'pages');
    for my $field (@required) {
        unless ($body =~ /\b$field\s*=/i) {
            print "ERROR in $file entry '$key': missing required field '$field'\n";
            $errors++;
        }
    }
}

exit($errors > 0 ? 1 : 0);
