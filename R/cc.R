cc_internal <- function(x, bracket = bracket, ellipsis = ellipsis) {
  ellipsis <- as.integer(ellipsis)
  ellipsis <- max(ellipsis, 4L)
  
  x <- trimws(x)
  n <- length(x)
  if(n > 0)
    x <- paste0(bracket, x, bracket)
  if(ellipsis <= n) 
    x <- c(x[1:(ellipsis-2)], "...", x[n])
  paste(x, collapse = ", ")
}

cc_conjunction <- function(x, conjunction, bracket, ellipsis, oxford) {
  ellipsis <- as.integer(ellipsis)
  ellipsis <- max(ellipsis, 5L)
  
  n <- length(x)
  res <- cc_internal(x[-n], bracket = bracket, ellipsis = (ellipsis - 1L))
  if(n > 0)
    x <- paste0(bracket, x[n], bracket, collapse = "")
  comma <- if(isTRUE(oxford) && n > 2) "," else ""
  conjunction <- paste0(" ", conjunction, " ", collapse = "")
  or <- if(n > 1L) conjunction else ""
  paste0(res, comma, or, x)
}


#' @export
cc <- function(object, ...) {
  UseMethod("cc")
}

#' Concatenation with Commas
#' 
#' Concatenates object values into a single string with each value separated
#' by a comma and possibly the last value separated by a conjunction.
#' 
#' @param object The object with values to concatenate.
#' @param conjunction A string of the conjunction to separate the last value by or NULL.
#' @param bracket A string to bracket the values by.
#' @param ellipsis A count of the total number of values required to use an ellipsis.
#' @param oxford A flag indicating whether to use the Oxford comma (if conjunction).
#' @param ... Unused
#' @seealso \code{\link{co}}
#' @examples
#' cc(c(1,1,1:2))
#' cc(100:1)
#' cc_and(1:100)
#' cc_or(100:1, bracket = "|", ellipsis = 5, oxford = TRUE)
#' cc(mtcars)
#' @name cc
NULL

#' @rdname cc
#' @export
cc.default <- function(object, conjunction = NULL, bracket = "'", ellipsis = 10, oxford = FALSE, ...) {
  object <- unlist(object)
  check_cc_args(conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
  if(is.null(conjunction)) return(cc_internal(object, bracket = bracket, ellipsis = ellipsis))
  cc_conjunction(object, conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
}

#' @rdname cc
#' @export
cc.data.frame <- function(object, conjunction = NULL, bracket = "'", ellipsis = 10, oxford = FALSE, ...) {
  check_cc_args(conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
  object <- colnames(object)
  if(is.null(conjunction)) return(cc_internal(object, bracket = bracket, ellipsis = ellipsis))
  cc_conjunction(object, conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
}

#' @rdname cc
#' @export
cc_or <- function(object, bracket = "'", ellipsis = 10, oxford = FALSE) {
  cc(object, conjunction = "or", bracket = bracket, ellipsis = ellipsis, oxford = oxford)
}

#' @rdname cc
#' @export
cc_and <- function(object, bracket = "'", ellipsis = 10, oxford = FALSE) {
  cc(object, conjunction = "and", bracket = bracket, ellipsis = ellipsis, oxford = oxford)
}
