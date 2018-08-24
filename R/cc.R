#' Concatenation with Commas
#' 
#' Concatenates character vector(s) into a single string with each value separated
#' by a comma.
#' 
#' @inheritParams err
#' @param bracket A string to bracket the values by.
#' @param ellipsis A count of the total number of values required to use an ellipsis.
#' @seealso \code{\link{cc_or}}, \code{\link{cc_and}} and \code{\link{cn}}
#' @export
#' @examples
#' cc(1,1,1:2)
#' cc(100:1)
cc <- function(..., bracket = "'", ellipsis = 10) {
  if((!is.integer(ellipsis) && !is.numeric(ellipsis))
     || !identical(length(ellipsis), 1L) || is.na(ellipsis) || ellipsis <= 3)
    err("ellipsis must be a count greater than 3")
  
  s <- unlist(list(...))
  s <- trimws(s)
  n <- length(s)
  if(n > 0)
    s <- paste0(bracket, s, bracket)
  if(ellipsis <= n) 
    s <- c(s[1:(ellipsis-2)], "...", s[n])
  paste(s, collapse = ", ")
}

cc_condition <- function(x, bracket, ellipsis, oxford, condition) {
  if((!is.integer(ellipsis) && !is.numeric(ellipsis))
     || !identical(length(ellipsis), 1L) || is.na(ellipsis) || ellipsis <= 4)
    err("ellipsis must be a count greater than 4")
  
  n <- length(x)
  res <- cc(x[-n], bracket = bracket, ellipsis = (ellipsis - 1L))
  if(n > 0)
    x <- paste0(bracket, x[n], bracket, collapse = "")
  comma <- if(isTRUE(oxford) && n > 2) "," else ""
  condition <- paste0(" ", condition, " ", collapse = "")
  or <- if(n > 1L) condition else ""
  paste0(res, comma, or, x)
}

#' Concatenation with Commas and Or
#' 
#' Concatenates character vector(s) into a single string with each value separated
#' by a comma and the final value separated by or.
#' 
#' @inheritParams err
#' @inheritParams cc
#' @param oxford A flag indicating whether to use the Oxford comma
#' @seealso \code{\link{cc}}, \code{\link{cc_and}} and \code{\link{cn_or}}
#' @export
#' @examples
#' cc_or(1,1,1:2)
#' cc_or(100:1)
#' cc_or(100:1, bracket = "", ellipsis = 5, oxford = TRUE)
cc_or <- function(..., bracket = "'", ellipsis = 10, oxford = FALSE) {
  x <- unlist(list(...))
  cc_condition(x = x, bracket = bracket, ellipsis = ellipsis, oxford = oxford, 
               condition = "or")
}

#' Concatenation with Commas and And
#' 
#' Concatenates character vector(s) into a single string with each value separated
#' by a comma and the final value separated by and.
#' 
#' @inheritParams err
#' @inheritParams cc
#' @inheritParams cc_or
#' @seealso \code{\link{cc}}, \code{\link{cc_or}} and \code{\link{cn_and}}
#' @export
#' @examples
#' cc_and(1,1,1:2)
#' cc_and(100:1)
#' cc_and(100:1, bracket = "|", ellipsis = 5, oxford = TRUE)
cc_and <- function(..., bracket = "'", ellipsis = 10, oxford = FALSE) {
  x <- unlist(list(...))
  cc_condition(x = x, bracket = bracket, ellipsis = ellipsis, oxford = oxford, 
               condition = "and")
}
