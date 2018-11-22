#' Error
#' 
#' Stops execution and throws an error without the call as part of the error message.
#' 
#' @param ... zero or more objects which can be coerced to character
#' @seealso \code{\link[base]{stop}}, \code{\link{wrn}}, \code{\link{msg}} and \code{\link{co}}
#' @export
err <- function(...) stop(..., call. = FALSE, domain = NA)

#' Warning
#' 
#' Immediately outputs an warning without the call as part of the error message
#' that as far as possible is a single line.
#' 
#' @inheritParams err
#' @seealso \code{\link[base]{warning}}, \code{\link{err}}, \code{\link{msg}} and \code{\link{co}}
#' @export
wrn <- function(...) warning(..., call. = FALSE, domain = NA)

#' Message
#' 
#' Generates a diagnostic message.
#' 
#' @inheritParams err
#' @seealso \code{\link[base]{message}}, \code{\link{err}}, \code{\link{wrn}} and and \code{\link{co}}
#' @export
msg <- function(...) message(..., domain = NA)

#' Paste
#'
#' Wrappers on \code{\link{paste}} and \code{\link{paste0}} 
#' to increase the readability of code.
#' 
#' @inheritParams base::paste
#' @return A string of the pasted values.
#' @export
#'
#' @examples
#' p("The", "red")
#' p0("ard", "vark")
p <- function(..., sep = " ", collapse = NULL) 
  paste(..., sep = sep, collapse = collapse)

#' @describeIn p Paste0
#' @export
p0 <- function(..., collapse = NULL) paste0(..., collapse = collapse)
