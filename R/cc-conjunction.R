#' Concatenation with Commas and Conjunction
#' 
#' Wrappers to concatenates object values with conjunction and by default brackets.
#'
#' @inheritParams cc
#' @seealso \code{\link{cc}}
#' @examples
#' cc_and(1:100)
#' cc_or(100:1)
#' @name cc_conjunction
NULL

#' @describeIn cc_conjunction Concatenation with Commas and And Conjunction
#' @export
cc_and <- function(object, bracket = "'") {
  cc(object, conjunction = "and", bracket = bracket)
}

#' @describeIn cc_conjunction Concatenation with Commas and Or Conjunction
#' @export
cc_or <- function(object, bracket = "'") {
  cc(object, conjunction = "or", bracket = bracket)
}
