#' Error
#' 
#' Stops execution and throws an error (without the call as part of the error message).
#' 
#' @param ... zero or more objects which can be coerced to character
#' @seealso \code{\link{stop}}, \code{\link{wrn}}, \code{\link{msg}} and \code{\link{cn}}
#' @export
err <- function(...) stop(..., call. = FALSE)

#' Warning
#' 
#' Generates a warning message (without the call as part of the error message).
#' 
#' @inheritParams err
#' @seealso \code{\link{warning}}, \code{\link{err}}, \code{\link{msg}} and \code{\link{cn}}
#' @export
wrn <- function(...) warning(..., call. = FALSE)

#' Message
#' 
#' Generates a diagnostic message.
#' 
#' @inheritParams err
#' @seealso \code{\link{message}}, \code{\link{err}}, \code{\link{wrn}} and and \code{\link{cn}}
#' @export
msg <- function(...) message(...)
