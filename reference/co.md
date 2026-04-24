# Customizable Object Aware String

Produces a fully customizable object aware string with consecutive
values separated by columns.

## Usage

``` r
# Default S3 method
co(
  object,
  one = "%o has %n value%s: %c",
  some = one,
  none = gsub(": ", "", some),
  lots = some,
  nlots = 10,
  conjunction = NULL,
  bracket = "",
  ellipsis = nlots,
  oxford = FALSE,
  object_name = substitute(object),
  ...
)

# S3 method for class 'character'
co(
  object,
  one = "%o has %n value%s: %c",
  some = one,
  none = gsub(": ", "", some),
  lots = some,
  nlots = 10,
  conjunction = NULL,
  bracket = "'",
  ellipsis = nlots,
  oxford = FALSE,
  object_name = substitute(object),
  ...
)

# S3 method for class 'factor'
co(
  object,
  one = "%o has %n value%s: %c",
  some = one,
  none = gsub(": ", "", some),
  lots = some,
  nlots = 10,
  conjunction = NULL,
  bracket = "'",
  ellipsis = nlots,
  oxford = FALSE,
  object_name = substitute(object),
  ...
)

# S3 method for class 'data.frame'
co(
  object,
  one = "%o has %n column%s\n%c",
  some = one,
  none = none,
  lots = some,
  nlots = 10,
  conjunction = NULL,
  ellipsis = nlots,
  oxford = FALSE,
  object_name = substitute(object),
  ...
)
```

## Arguments

- object:

  The object of length `n`

- one:

  The string to return if `n = 1`

- some:

  The string to return if n is in `2, 3, ..., nlots - 1`

- none:

  The string to return if `n = 0`

- lots:

  The string to return if `n >= nlots`

- nlots:

  A count of the number of values to consider to be lots

- conjunction:

  A string of the conjunction to separate the last value by or NULL.

- bracket:

  A string to bracket the values by.

- ellipsis:

  A count of the total number of values required to use an ellipsis.

- oxford:

  A flag indicating whether to use the Oxford comma (if conjunction).

- object_name:

  A string of the object name.

- ...:

  Unused.

## `sprintf`-like types

The following `sprintf`-like types can be used in the custom messages:

- `c`:

  the object as a comma separated list (produced by a
  [`cc`](https://poissonconsulting.github.io/err/reference/cc.md)
  function)

- `n`:

  the length of the object

- `o`:

  the name of the object

- `s`:

  's' if n != 1 otherwise ”

- `r`:

  'are' if n != 1 otherwise 'is'

## See also

[`cc`](https://poissonconsulting.github.io/err/reference/cc.md)

## Examples

``` r
co(character())
#> [1] "character() has 0 values"
x <- "fox"
co(x)
#> [1] "x has 1 value: 'fox'"
co(c(1,2,5))
#> [1] "c(1, 2, 5) has 3 values: 1, 2, 5"
co(1:10)
#> [1] "1:10 has 10 values: 1, 2, 3, 4, 5, 6, 7, 8, ..., 10"
co(datasets::mtcars)
#> [1] "datasets::mtcars has 11 columns\nmpg: 21, 21, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, ..., 21.4\ncyl: 6, 6, 4, 6, 8, 6, 8, 4, ..., 4\ndisp: 160, 160, 108, 258, 360, 225, 360, 146.7, ..., 121\nhp: 110, 110, 93, 110, 175, 105, 245, 62, ..., 109\ndrat: 3.9, 3.9, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, ..., 4.11\nwt: 2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, ..., 2.78\nqsec: 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20, ..., 18.6\nvs: 0, 0, 1, 1, 0, 1, 0, 1, ..., 1\n...\ncarb: 4, 4, 1, 1, 2, 1, 4, 2, ..., 2"
```
