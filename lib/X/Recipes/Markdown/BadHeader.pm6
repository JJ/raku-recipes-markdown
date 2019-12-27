unit class X::Recipes::Markdown::BadHeader is Exception;

method message() {
    "First item should be a level-1 with recipe title";
}
