# Wrappers with Conjunction and ” Brackets.

Wrappers with Conjunction and ” Brackets.

## Usage

``` r
cc_and(object)

cc_or(object)

co_and(
  object,
  one = "%o has %n value%s: %c",
  object_name = substitute(object)
)

co_or(
  object,
  one = "%o has %n value%s: %c",
  object_name = substitute(object)
)
```

## Arguments

- object:

  The object with values to concatenate.

- one:

  The string to return if `n = 1`

- object_name:

  A string of the object name.

## Functions

- `cc_and()`: Concatenation with Commas and And Conjunction

- `cc_or()`: Concatenation with Commas and Or Conjunction

- `co_and()`: Customizable Object Aware String and And Conjunction

- `co_or()`: Customizable Object Aware String and Or Conjunction

## See also

[`cc`](https://poissonconsulting.github.io/err/reference/cc.md) and
[`co`](https://poissonconsulting.github.io/err/reference/co.md)

## Examples

``` r
cc_and(1:100)
#> [1] "1, 2, 3, 4, 5, 6, 7, 8, ... and 100"
cc_or(100:1)
#> [1] "100, 99, 98, 97, 96, 95, 94, 93, ... or 1"
co_and(1:100)
#> [1] "1:100 has 100 values: 1, 2, 3, 4, 5, 6, 7, 8, ... and 100"
co_or(100:1)
#> [1] "100:1 has 100 values: 100, 99, 98, 97, 96, 95, 94, 93, ... or 1"
```
