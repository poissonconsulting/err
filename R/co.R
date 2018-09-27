co_sub <- function(string, object, object_name, ...) {
  n <- length(object)
  string <- gsub("%s", if(identical(n, 1L)) "" else "s", string, fixed = TRUE)
  string <- gsub("%r", if(identical(n, 1L)) "is" else "are", string, fixed = TRUE)
  string <- gsub("%n", n, string, fixed = TRUE)
  string <- gsub("%o", object_name, string, fixed = TRUE)
  
  gsub("%c", cc(object, ...), string, fixed = TRUE)
}

#' @export
co <- function(object, ...) {
  UseMethod("co")
}

#' Customisable Object Aware Message
#' 
#' Produces a fully customisable object aware message with consecutive values
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
#'   \item{\code{r}}{'are' if n != 1 otherwise 'is'}
#' }
#' 
#' 
#' @param object The object of length n.
#' @param one The string to return if n = 1
#' @param some The string to return if n is in 2, 3, ..., nlots - 1
#' @param none The string to return if n = 0
#' @param lots The string to return if n >= nlots
#' @param nlots A count of the number of values to consider to be lots.
#' @param object_name A string of the object name.
#' @inheritParams cc
#' @param ... Unused.
#' @seealso \code{\link{cc}}
#' @examples
#' co(character())
#' x <- "fox"
#' co(x)
#' co(c(1,2,5))
#' co(1:10)
#' co(datasets::mtcars)
#' @name co
NULL

#' @rdname co
#' @export
co.default <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, nlots = 10, 
  conjunction = NULL, bracket = "", ellipsis = nlots, oxford = FALSE, 
  object_name = substitute(object), ...) {
  object_name <- deparse_object_name(object_name)
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  co_sub(string, object, object_name, conjunction = conjunction, bracket = bracket,
         ellipsis = ellipsis, oxford = oxford)
}

#' @rdname co
#' @export
co.character <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, nlots = 10, 
  conjunction = NULL, bracket = "'", ellipsis = nlots, oxford = FALSE, 
  object_name = substitute(object), ...) {
  
  object_name <- deparse_object_name(object_name)
  co.default(object = object, one = one, some = some, none = none, lots = lots,
             nlots = nlots, conjunction = conjunction, bracket = bracket, 
             ellipsis = ellipsis, oxford = oxford, object_name = object_name)
}

#' @rdname co
#' @export
co.factor <- function(
  object, one = "%o has %n value%s: %c", 
  some = one, none = gsub(": ", "", some), lots = some, nlots = 10, 
  conjunction = NULL, bracket = "'", ellipsis = nlots, oxford = FALSE, 
  object_name = substitute(object), ...) {
  
  object_name <- deparse_object_name(object_name)
  co.default(object = object, one = one, some = some, none = none, lots = lots,
             nlots = nlots, conjunction = conjunction, bracket = bracket, 
             ellipsis = ellipsis, oxford = oxford, object_name = object_name)
}

#' @rdname co
#' @export
co.data.frame <- function(
  object, one = "%o has %n column%s\n%c", 
  some = one, none = none, lots = some, nlots = 10, 
  conjunction = NULL, ellipsis = nlots, oxford = FALSE, 
  object_name = substitute(object), ...) {
  object_name <- deparse_object_name(object_name)
  string <- n_string(length(object), one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  co_sub(string, object, object_name, conjunction = conjunction, 
         ellipsis = ellipsis, oxford = oxford)
}
