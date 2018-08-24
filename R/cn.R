cn_sub <- function(string, fun, object, object_name, ...) {
  n <- length(object)
  string <- gsub("%s", if(identical(n, 1L)) "" else "s", string, fixed = TRUE)
  string <- gsub("%n", n, string, fixed = TRUE)
  string <- gsub("%o", object_name, string, fixed = TRUE)
  gsub("%c", fun(object, ...), string, fixed = TRUE)
}

#' Customisable Number Aware Message
#' 
#' Produces a fully customisable number aware message with consecutive values
#' separated by columns.
#' 
#' @section \code{sprintf}-like types:
#' The following \code{sprintf}-like types can be used in the custom messages:
#' 
#' \describe{
#'   \item{\code{c}}{the object as a comma separated list (producted by a \code{\link{cc}} function)}
#'   \item{\code{n}}{the length of the object}
#'   \item{\code{o}}{the name of the object}
#'   \item{\code{s}}{'s' if n != 1 otherwise ''}
#' }
#' 
#' 
#' @param object An object that can be coerced to character vector of length n..
#' @param one The string to return if n = 1
#' @param some The string to return if n is in 2, 3, ..., nlots - 1
#' @param none The string to return if n = 0
#' @param lots The string to return if n >= nlots
#' @inheritParams cc
#' @param nlots A count of the number of values to consider to be lots.
#' @seealso \code{\link{cn_or}}, \code{\link{cn_and}} and \code{\link{cc}}
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
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  cn_sub(string, cc, object, object_name, bracket = bracket, ellipsis = ellipsis)
}

#' Customisable Number Aware Message with Or
#' 
#' Produces a fully customisable number aware message with consecutive values
#' separated by commas and or.
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @inheritSection cn \code{sprintf}-like types
#' @seealso \code{\link{cn}}, \code{\link{cn_and}} and \code{\link{cc_or}}
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
  bracket = "'", ellipsis = 10, oxford = FALSE, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_or, object, object_name = object_name, bracket = bracket,
         ellipsis = ellipsis, oxford = oxford)
}

#' Customisable Number Aware Message with Commas and And
#' 
#' Produces a fully customisable number aware message with consecutive values
#' separated by commas and and.
#' 
#' @inheritParams cn
#' @inheritParams cc_or
#' @seealso \code{\link{cn}}, \code{\link{cn_or}} and \code{\link{cc_and}}
#' @inheritSection cn \code{sprintf}-like types
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
  bracket = "'", ellipsis = 10, oxford = FALSE, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, nlots = nlots)
  cn_sub(string, cc_and, object, object_name = object_name, bracket = bracket,
         ellipsis = ellipsis, oxford = oxford)
}
