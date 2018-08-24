#' Error
#' 
#' Stops execution and throws an error without the call as part of the error message.
#' 
#' @param ... zero or more objects which can be coerced to character
#' @seealso \code{\link[base]{stop}}, \code{\link{wrn}}, \code{\link{msg}} and \code{\link{co}}
#' @export
err <- function(...) stop(..., call. = FALSE)

#' Warning
#' 
#' Immediately outputs an warning without the call as part of the error message
#' that as far as possible is a single line.
#' 
#' @inheritParams err
#' @seealso \code{\link[base]{warning}}, \code{\link{err}}, \code{\link{msg}} and \code{\link{co}}
#' @export
wrn <- function(...) warning(..., call. = FALSE, immediate. = TRUE, noBreaks. = TRUE)

#' Message
#' 
#' Generates a diagnostic message.
#' 
#' @inheritParams err
#' @seealso \code{\link[base]{message}}, \code{\link{err}}, \code{\link{wrn}} and and \code{\link{co}}
#' @export
msg <- function(...) message(...)
