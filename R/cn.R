#' Customizable Number Aware String
#' 
#' @section \code{sprintf}-like types:
#' The following \code{sprintf}-like types can be used in the custom messages:
#' 
#' \describe{
#'   \item{\code{n}}{the length of the object}
#'   \item{\code{s}}{'s' if n != 1 otherwise ''}
#' }
#' 
#' @param n A count of the number.
#' @inheritParams co
#' @return A string of the updated message.
#' @seealso \code{\link{cc}} and \code{\link{co}}
#' @export
#' @examples
#' cn(0)
#' cn(1)
#' cn(4)
cn <- function(n, one = "there %r %n value%s", 
               some = one, none = some, lots = some, nlots = 10) {
  if((!is.integer(n) && !is.numeric(n))
     || !identical(length(n), 1L) || is.na(n) || n < 0)
    err("n must be a count")
  string <- n_string(n, one = one, some = some, none = none, lots = lots, 
                      nlots = nlots)
  string <- gsub("%s", if(n == 1) "" else "s", string, fixed = TRUE)
  string <- gsub("%r", if(n == 1) "is" else "are", string, fixed = TRUE)
  gsub("%n", n, string, fixed = TRUE)  
}
