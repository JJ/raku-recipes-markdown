use v6.c;
use Test;
use Recipes::Markdown;
use X::Recipes::Markdown::BadHeader;

my $dir;

if "recipes/tuna-risotto.md".IO.e {
    $dir = "recipes/";
} else {
    $dir = "../recipes/";
}

ok( $dir, "Found test directory");

my $recipes= Recipes::Markdown.new( file => $dir ~ "tuna-risotto.md" );
isa-ok( $recipes, Recipes::Markdown, "Class instantiated correctly" );

throws-like { Recipes::Markdown.new( file => "$dir/bad-recipe.md" ) },
        X::Recipes::Markdown::BadHeader, "Throws bad header exception OK";
done-testing;
