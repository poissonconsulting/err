co_sub <- function(string, fun, object, object_name, ...) {
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
#' @seealso \code{\link{co_or}}, \code{\link{co_and}} and \code{\link{cc}}
#' @examples
#' co(character())
#' x <- "fox"
#' co(x)
#' co(c(1,2,5))
#' co(1:10)
#' @export
co <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  bracket = "", ellipsis = 10, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  co_sub(string, cc, object, object_name, bracket = bracket, ellipsis = ellipsis)
}

#' Customisable Number Aware Message with Or
#' 
#' Produces a fully customisable number aware message with consecutive values
#' separated by commas and or.
#' 
#' @inheritParams co
#' @inheritParams cc_or
#' @inheritSection co \code{sprintf}-like types
#' @seealso \code{\link{co}}, \code{\link{co_and}} and \code{\link{cc_or}}
#' @examples 
#' co_or(character())
#' x <- "fox"
#' co_or(x)
#' co_or(c(1,2,5))
#' co_or(1:10)
#' @export
co_or <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  bracket = "'", ellipsis = 10, oxford = FALSE, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, nlots = nlots)
  co_sub(string, cc_or, object, object_name = object_name, bracket = bracket,
         ellipsis = ellipsis, oxford = oxford)
}

#' Customisable Number Aware Message with Commas and And
#' 
#' Produces a fully customisable number aware message with consecutive values
#' separated by commas and and.
#' 
#' @inheritParams co
#' @inheritParams cc_or
#' @seealso \code{\link{co}}, \code{\link{co_or}} and \code{\link{cc_and}}
#' @inheritSection co \code{sprintf}-like types
#' @examples 
#' co_and(character())
#' x <- "fox"
#' co_and(x)
#' co_and(c(1,2,5))
#' co_and(1:10)
#' @export
co_and <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, 
  bracket = "'", ellipsis = 10, oxford = FALSE, nlots = ellipsis) {
  object_name <- deparse(substitute(object))
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, nlots = nlots)
  co_sub(string, cc_and, object, object_name = object_name, bracket = bracket,
         ellipsis = ellipsis, oxford = oxford)
}
