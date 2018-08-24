
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.com/poissonconsulting/err.svg?branch=master)](https://travis-ci.com/poissonconsulting/err)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/err/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/err?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Introduction

`err` is an R package to produce number sensitive error and warning
messages.

## Utilisation

``` r
library(err)

x <- 1:6
err(cn_and(x, "the %n erroneous values are: %c"))
#> Error: the 6 erroneous values are: 1, 2, 3, 4, 5 and 6
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

  Joe Thorley and James Dunham (2018). err: Number Sensitive Error
  and Warning Messages. R package version 0.0.0.9000.
  https://github.com/poissonconsulting/err

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {err: Number Sensitive Error and Warning Messages},
    author = {Joe Thorley and James Dunham},
    year = {2018},
    note = {R package version 0.0.0.9000},
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

## Inspiration

[`concatenate`](https://github.com/jamesdunham/concatenate) by [James
Dunham](https://github.com/jamesdunham)
