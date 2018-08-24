cn_string <- function(object, one, some, none, lots, nlots) {
  n <- length(object)
  if(n == 1) return(one)
  if(n == 0) return(none)
  if(n >= nlots) return(lots)
  some
}

cn_sub <- function(string, fun, object, object_name, ...) {
  n <- length(object)
  string <- gsub("%s", if(identical(n, 1L)) "" else "s", string, fixed = TRUE)
  string <- gsub("%n", n, string, fixed = TRUE)
  string <- gsub("%o", object_name, string, fixed = TRUE)
  gsub("%c", fun(object, ...), string, fixed = TRUE)
}

#' Number Aware Concatenation with Commas
#' 
#' Concatenates character vector(s) into a single string with each value separated
#' by a comma.
#' 
#' @param object An object that can be coerced to character vector of length n..
#' @param one The string to return if n = 1
#' @param some The string to return if n is in 2, 3, ..., nlots - 1
#' @param none The string to return if n = 0
#' @param lots The string to return if n >= nlots
#' @inheritParams cc
#' @param nlots A count of the number of values to consider to be lots.
#' @seealso \code{\link{cc}}, \code{\link{cn_or}} and \code{\link{cc_and}}
#' @examples
#' cn(character())
#' x <- "fox"
#' cn(x)
#' cn(c(1,2,5))
#' cn(1:10)
#' @export
cn <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  bracket = "", ellipsis = 10, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- cn_string(object, one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  cn_sub(string, cc, object, object_name, bracket = bracket, ellipsis = ellipsis)
}

#' Number Aware Concatenation with Commas and Or
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @seealso \code{\link{cc_or}}, \code{\link{cn}} and \code{\link{cc_and}}
#' @examples 
#' cn_or(character())
#' x <- "fox"
#' cn_or(x)
#' cn_or(c(1,2,5))
#' cn_or(1:10)
#' @export
cn_or <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  oxford = FALSE, bracket = "", ellipsis = 10, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- cn_string(object, one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_or, object, object_name = object_name, oxford = oxford, bracket = bracket,
         ellipsis = ellipsis)
}

#' Number Aware Concatenation with Commas and And
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @seealso \code{\link{cc_and}}, \code{\link{cn}} and \code{\link{cc_or}}
#' @examples 
#' cn_and(character())
#' x <- "fox"
#' cn_and(x)
#' cn_and(c(1,2,5))
#' cn_and(1:10)
#' @export
cn_and <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  oxford = FALSE, bracket = "", ellipsis = 10, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- cn_string(object, one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_and, object, object_name = object_name, oxford = oxford, bracket = bracket,
         ellipsis = ellipsis)
}
