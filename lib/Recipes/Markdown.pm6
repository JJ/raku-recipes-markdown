use Text::Markdown;

unit class Recipes::Markdown:ver<0.0.1>:auth<cpan:JMERELO>;

has $.file;
has $.markdown;

submethod BUILD( :$!file) {
    $!markdown = parse-markdown-from-file($!file);
}

=begin pod

=head1 NAME

Recipes::Markdown - Semistructured recipes written in Markdown

=head1 SYNOPSIS

=begin code :lang<perl6>

use Recipes::Markdown;

=end code

=head1 DESCRIPTION

Recipes::Markdown is a support library for the Raku Recipes book, which will
be published by APress.

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
