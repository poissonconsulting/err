
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/err.svg?branch=master)](https://travis-ci.com/poissonconsulting/err)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/err/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/err?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Introduction

> To err is human - Alexander Pope (1711)

`err` is an R package to produce customizable number and object
sensitive error and warning messages.

## Demonstration

### Object Sensitive

The `co` functions produce object sensitive strings.

``` r
library(err)

fox <- c("The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog")
co_and(fox)
#> [1] "fox has 9 values: 'The', 'quick', 'brown', 'fox', 'jumps', 'over', 'the', 'lazy' and 'dog'"
co_and(fox[1])
#> [1] "fox[1] has 1 value: 'The'"
co_and(fox[0])
#> [1] "fox[0] has 0 values"
co_and(fox, ellipsis = 5)
#> [1] "fox has 9 values: 'The', 'quick', ..., 'lazy' and 'dog'"
```

### Customisable

The object sensitive strings are fully customised.

``` r
one <- "darn! the vector %o of length %n has the following value: %c"
none <- "phew! vector %o is empty"
some <- "rats! vector %o has the following %n element%s: %c"
lots <- "really?! the %n elements of vector %o are too numerous to print"

co_and(fox[0], one = one, none = none, some = some, lots = lots, nlots = 5)
#> [1] "phew! vector fox[0] is empty"
co_and(fox[1], one = one, none = none, some = some, lots = lots, nlots = 5)
#> [1] "darn! the vector fox[1] of length 1 has the following value: 'The'"
co_and(fox[1:3], one = one, none = none, some = some, lots = lots, nlots = 5)
#> [1] "rats! vector fox[1:3] has the following 3 elements: 'The', 'quick' and 'brown'"
co_and(fox[1:5], one = one, none = none, some = some, lots = lots, nlots = 5)
#> [1] "really?! the 5 elements of vector fox[1:5] are too numerous to print"
```

The following `sprintf`-like types can be used in the custom messages:

  - `%c`: the object as a comma separated list (producted by a `cc`
    function)
  - `%n`: the length of the object
  - `%o`: the name of the object
  - `%s`: ‘s’ if n \!= 1 otherwise ’’

And there are various formatting options

``` r
co_or(fox[1:6], bracket = "|", oxford = TRUE, ellipsis = 5)
#> [1] "fox[1:6] has 6 values: |The|, |quick|, ..., |jumps|, or |over|"
```

### Number Sensitive

The `cn` function produces number sensitive customisable messages

``` r
cn(0)
#> [1] "0 values"
cn(1)
#> [1] "1 value"
cn(2)
#> [1] "2 values"
cn(100, lots = "there really are %n value%s")
#> [1] "there really are 100 values"
```

### Warning and Error Messages

The `co` and `cn` functions can be combined with the wrappers `msg`,
`wrn` and `err` to produce a message, warning and error (without the
call as part of the warning/error message).

``` r
msg(cn(2))
#> 2 values
wrn(cn(2))
#> Warning: 2 values
err(cn(2))
#> Error: 2 values
```

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/err)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/err")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("err")

## Citation

``` 

To cite package 'err' in publications use:

  Joe Thorley and James Dunham (2018). err: Customisable Number
  Sensitive Error and Warning Messages. R package version
  0.0.0.9004. https://github.com/poissonconsulting/err

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {err: Customisable Number Sensitive Error and Warning Messages},
    author = {Joe Thorley and James Dunham},
    year = {2018},
    note = {R package version 0.0.0.9004},
    url = {https://github.com/poissonconsulting/err},
  }
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/err/issues).

[Pull requests](https://github.com/poissonconsulting/err/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Utilisation

The [`checkr`](https://github.com/poissonconsulting/checkr) R package is
powered by `err`.

## Inspiration

[`concatenate`](https://github.com/jamesdunham/concatenate) by [James
Dunham](https://github.com/jamesdunham)
