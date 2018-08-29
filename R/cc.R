cc_internal <- function(x, bracket = bracket, ellipsis = ellipsis, collapse = ", ") {
  ellipsis <- as.integer(ellipsis)
  ellipsis <- max(ellipsis, 4L)
  
  x <- trimws(x)
  n <- length(x)
  if(n > 0)
    x <- paste0(bracket, x, bracket)
  if(ellipsis <= n) 
    x <- c(x[1:(ellipsis-2)], "...", x[n])
  paste(x, collapse = collapse)
}

cc_conjunction <- function(x, conjunction, bracket, ellipsis, oxford) {
  x <- cc_internal(x, bracket = bracket, ellipsis = ellipsis, collapse = NULL)
  n <- length(x)
  if(n <= 1L) return (paste(x, collapse = ", "))
  if(n == 2L) return(paste(x, collapse = paste("", conjunction, "")))
  x[n] <- paste(conjunction, x[n], collapse = " ")
  if(isTRUE(oxford)) return(paste(x, collapse = ", "))
  paste(paste(x[1:(n-1L)], collapse = ", "), x[n], collapse = " ")
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
#' cc(1:100, "and")
#' cc(100:1, "or", bracket = "|", ellipsis = 5, oxford = TRUE)
#' cc(mtcars)
#' @name cc
NULL

#' @rdname cc
#' @export
cc.default <- function(object, conjunction = NULL, bracket = "'", ellipsis = 10, oxford = FALSE, ...) {
  check_cc_args(conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
  object <- unlist(object)
  ellipsis <- as.integer(ellipsis)
  if(is.null(conjunction)) return(cc_internal(object, bracket = bracket, ellipsis = ellipsis))
  cc_conjunction(object, conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
}

#' @rdname cc
#' @export
cc.data.frame <- function(object, conjunction = NULL, bracket = "'", ellipsis = 10, oxford = FALSE, ...) {
  check_cc_args(conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
  object <- as.list(object)
  ellipsis <- as.integer(ellipsis)
  ellipsis <- max(ellipsis, 4L)
  if(!is.null(conjunction)) 
    ellipsis <- max(ellipsis, 5L)
  
  if(identical(length(object), 0L)) return ("")
  object <- object[1:(min(ellipsis, length(object)))]
  object <- lapply(object, cc, conjunction = conjunction, bracket = bracket, ellipsis = ellipsis, oxford = oxford)
  object <- mapply(paste0, names(object), ": ", object)
  conjunction <- paste0(" ", conjunction, collapse = "")
  if(identical(length(object), ellipsis)) {
    object[ellipsis - 1L] <- "..."
    if(!is.null(conjunction)) {
      if(oxford) object[ellipsis - 1L] <- paste0(object[ellipsis - 1L], ",", sep = "")
      object[ellipsis - 1L] <- paste0(object[ellipsis - 1L], conjunction, sep = "")
    }
  }
  object <- paste0(object, collapse = "\n")
  object
}
