cn_string <- function(x, one, some, none, lots, nlots) {
  n <- length(x)
  if(n == 1) return(one)
  if(n == 0) return(none)
  if(n >= nlots) return(lots)
  some
}

cn_sub <- function(string, fun, x, ...) {
  string <- gsub("%n", length(x), string, fixed = TRUE)
  gsub("%c", fun(x, ...), string, fixed = TRUE)
}

#' Number Aware Concatenation with Commas
#' 
#' Concatenates character vector(s) into a single string with each value separated
#' by a comma.
#' 
#' @param x A vector of length n that can be coerced to character.
#' @param one The string to return if n = 1
#' @param some The string to return if n is in 2, 3, ..., nlots - 1
#' @param none The string to return if n = 0
#' @param lots The string to return if n >= nlots
#' @inheritParams cc
#' @param nlots A count of the number of values to consider to be lots.
#' @seealso \code{\link{cc}}, \code{\link{cn_or}} and \code{\link{cc_and}}
#' @examples
#' cn(1:3, "the %n elements are: %c")
#' fun <- function(x) {
#'  cn(x, 
#'   one = "there is 1 element: %c",
#'   some = "there are %n elements: %c",
#'   none = "there are %n elements",
#'   )
#'  }
#'  fun("3")
#'  fun(character(0))
#'  fun(3:2)
#'  fun(1:10)
#' @export
cn <- function(x, one, some = one, none = some, lots = none, bracket = "", nlots = 10) {
  string <- cn_string(x, one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc, x, bracket = bracket)
}

#' Number Aware Concatenation with Commas and Or
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @seealso \code{\link{cc_or}}, \code{\link{cn}} and \code{\link{cc_and}}
#' @examples 
#' cn_or(3:1, "the %n elements are: %c")
#' fun <- function(x) {
#'  cn_or(x, 
#'   one = "there is 1 element: %c",
#'   some = "there are %n elements: %c",
#'   none = "there are %n elements",
#'   bracket = "'"
#'   )
#'  }
#'  fun("3")
#'  fun(character(0))
#'  fun(3:2)
#'  fun(1:10)
#' @export
cn_or <- function(x, one, some = one, none = some, lots = some, 
               oxford = FALSE, bracket = "", nlots = 10) {
  string <- cn_string(x, one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_or, x, oxford = oxford, bracket = bracket)
}

#' Number Aware Concatenation with Commas and And
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @seealso \code{\link{cc_and}}, \code{\link{cn}} and \code{\link{cc_or}}
#' @examples 
#' cn_and(3:1, "the %n elements are: %c")
#' fun <- function(x) {
#'  cn_and(x, 
#'   one = "there is 1 element: %c",
#'   some = "there are %n elements: %c",
#'   none = "there are %n elements (too many to list!)",
#'   oxford = TRUE
#'   )
#'  }
#'  fun("3")
#'  fun(character(0))
#'  fun(3:2)
#'  fun(1:10)
#' @export
cn_and <- function(x, one, some = one, none = some, lots = some, 
               oxford = FALSE, bracket = "", nlots = 10) {
  string <- cn_string(x, one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_and, x, oxford = oxford, bracket = bracket)
}
