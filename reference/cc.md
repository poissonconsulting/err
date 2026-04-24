# Concatenation with Commas

Concatenates object values into a string with each value separated by a
comma and possibly the last value separated by a conjunction.

## Usage

``` r
# Default S3 method
cc(
  object,
  conjunction = NULL,
  bracket = "",
  ellipsis = 10,
  oxford = FALSE,
  ...
)

# S3 method for class 'character'
cc(
  object,
  conjunction = NULL,
  bracket = "'",
  ellipsis = 10,
  oxford = FALSE,
  ...
)

# S3 method for class 'factor'
cc(
  object,
  conjunction = NULL,
  bracket = "'",
  ellipsis = 10,
  oxford = FALSE,
  ...
)

# S3 method for class 'data.frame'
cc(object, conjunction = NULL, ellipsis = 10, oxford = FALSE, ...)
```

## Arguments

- object:

  The object with values to concatenate.

- conjunction:

  A string of the conjunction to separate the last value by or NULL.

- bracket:

  A string to bracket the values by.

- ellipsis:

  A count of the total number of values required to use an ellipsis.

- oxford:

  A flag indicating whether to use the Oxford comma (if conjunction).

- ...:

  Unused

## See also

[`co`](https://poissonconsulting.github.io/err/reference/co.md)

## Examples

``` r
cc(c(1,1,1:2))
#> [1] "1, 1, 1, 2"
cc(100:1)
#> [1] "100, 99, 98, 97, 96, 95, 94, 93, ..., 1"
cc(1:100, "and")
#> [1] "1, 2, 3, 4, 5, 6, 7, 8, ... and 100"
cc(100:1, "or", bracket = "|", ellipsis = 5, oxford = TRUE)
#> [1] "|100|, |99|, |98|, ..., or |1|"
cc(mtcars)
#> [1] "mpg: 21, 21, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, ..., 21.4\ncyl: 6, 6, 4, 6, 8, 6, 8, 4, ..., 4\ndisp: 160, 160, 108, 258, 360, 225, 360, 146.7, ..., 121\nhp: 110, 110, 93, 110, 175, 105, 245, 62, ..., 109\ndrat: 3.9, 3.9, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, ..., 4.11\nwt: 2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, ..., 2.78\nqsec: 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20, ..., 18.6\nvs: 0, 0, 1, 1, 0, 1, 0, 1, ..., 1\n...\ncarb: 4, 4, 1, 1, 2, 1, 4, 2, ..., 2"
```
