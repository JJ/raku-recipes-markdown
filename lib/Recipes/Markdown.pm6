use Text::Markdown;
use X::Recipes::Markdown::BadHeader;

unit class Recipes::Markdown:ver<0.0.1>:auth<cpan:JMERELO>;

has $.file;
has $.markdown;
has $.title;
has $.description;
has %.sections;

submethod BUILD( :$!file) {
    $!markdown = parse-markdown-from-file($!file);
    X::Recipes::Markdown::BadHeader.new.throw
            unless $!markdown.document.items[0] ~~ Text::Markdown::Heading
            and $!markdown.document.items[0].level == 1;
    $!title = $!markdown.document.items[0].text;
    $!description = $!markdown.document.items[1].items.join("");
    %!sections = extract-sections( $!markdown.document.items );
}


sub extract-sections ( $markdown --> Associative ) {
    my @chunks = $markdown<>;
    shift @chunks;
    shift @chunks;  # Eliminates title and description
    my %sections;
    my $current-section;
    for @chunks -> $c {
        if  $c ~~ Text::Markdown::Heading {
            $current-section = $c.text;
            %sections{$current-section} = [];
        } else {
            %sections{$current-section}.push: $c;
        }
    }
    return %sections;
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
