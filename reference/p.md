# Paste

Wrappers on [`paste`](https://rdrr.io/r/base/paste.html) and
[`paste0`](https://rdrr.io/r/base/paste.html) to increase the
readability of code.

## Usage

``` r
p(..., sep = " ", collapse = NULL)

p0(..., collapse = NULL)
```

## Arguments

- ...:

  one or more R objects, to be converted to character vectors.

- sep:

  a character string to separate the terms. Not
  [`NA_character_`](https://rdrr.io/r/base/NA.html).

- collapse:

  an optional character string to separate the results. Not
  [`NA_character_`](https://rdrr.io/r/base/NA.html). When `collapse` is
  a string, the result is always a string
  ([`character`](https://rdrr.io/r/base/character.html) of length 1).

## Value

A string of the pasted values.

## Functions

- `p0()`: Paste0

## Examples

``` r
p("The", "red")
#> [1] "The red"
p0("ard", "vark")
#> [1] "ardvark"
```
