#' Wrappers with Conjunction and '' Brackets.
#' 
#' @inheritParams cc
#' @inheritParams co
#' @seealso \code{\link{cc}} and \code{\link{co}}
#' @examples
#' cc_and(1:100)
#' cc_or(100:1)
#' co_and(1:100)
#' co_or(100:1)
#' @name err_wrappers
NULL

#' @describeIn err_wrappers Concatenation with Commas and And Conjunction
#' @export
cc_and <- function(object) {
  cc(object, conjunction = "and")
}

#' @describeIn err_wrappers Concatenation with Commas and Or Conjunction
#' @export
cc_or <- function(object) {
  cc(object, conjunction = "or")
}

#' @describeIn err_wrappers Customizable Object Aware String and And Conjunction
#' @export
co_and <- function(object, one = "%o has %n value%s: %c", object_name = substitute(object)) {
  object_name <- err_deparse(object_name)
  co(object, one = one, conjunction = "and", object_name = object_name)
}

#' @describeIn err_wrappers Customizable Object Aware String and Or Conjunction
#' @export
co_or <- function(object, one = "%o has %n value%s: %c", object_name = substitute(object)) {
  object_name <- err_deparse(object_name)
  co(object, one = one, conjunction = "or", object_name = object_name)
}
