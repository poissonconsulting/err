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
