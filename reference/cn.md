# Customizable Number Aware String

Customizable Number Aware String

## Usage

``` r
cn(
  n,
  one = "there %r %n value%s",
  some = one,
  none = some,
  lots = some,
  nlots = 10
)
```

## Arguments

- n:

  A count of the number.

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

## Value

A string of the updated message.

## `sprintf`-like types

The following `sprintf`-like types can be used in the custom messages:

- `n`:

  the length of the object

- `s`:

  's' if n != 1 otherwise ”

## See also

[`cc`](https://poissonconsulting.github.io/err/reference/cc.md) and
[`co`](https://poissonconsulting.github.io/err/reference/co.md)

## Examples

``` r
cn(0)
#> [1] "there are 0 values"
cn(1)
#> [1] "there is 1 value"
cn(4)
#> [1] "there are 4 values"
```
