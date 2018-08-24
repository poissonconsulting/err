#' Customisable S
#' 
#' @param n A count.
#' @param text A string of the message.
#' @return A string of the updated message.
#' @seealso \code{\link{cc}} and \code{\link{cn}}
#' @export
#' @examples
#' cs(0)
#' cs(1)
#' cs(2)
#' cs(1, "value%s")
#' cs(4, "value%s")
cs <- function(n, text = "%s") {
  if((!is.integer(n) && !is.numeric(n))
     || !identical(length(n), 1L) || is.na(n) || n < 0)
    err("n must be a count")
  gsub("%s", if(n == 1) "" else "s", text, fixed = TRUE)
}
