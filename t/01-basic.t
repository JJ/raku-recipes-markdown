use v6.c;
use Test;
use Recipes::Markdown;

my $test-file;

if "recipes/tuna-risotto.md".IO.e {
    $test-file = "recipes/tuna-risotto.md";
} else {
    $test-file = "../recipes/tuna-risotto.md";
}

ok( $test-file, "Found test file");

my $recipes= Recipes::Markdown.new( file => $test-file );
isa-ok( $recipes, Recipes::Markdown, "Class instantiated correctly" );

done-testing;
