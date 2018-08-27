check_cc_args <- function(conjunction, bracket, ellipsis, oxford) {
  if(!is.null(conjunction) && (!is.character(conjunction) || 
     !identical(length(conjunction), 1L) || is.na(conjunction)))
    err("conjunction must be NULL or a string")
  
  if(!is.character(bracket) || !identical(length(bracket), 1L)  || is.na(bracket))
    err("bracket must be a string")
  
  if((!is.integer(ellipsis) && !is.numeric(ellipsis)) || !identical(length(ellipsis), 1L) || is.na(ellipsis))
    err("ellipsis must be a number")
  
  if(!is.logical(oxford) || !identical(length(oxford), 1L)  || is.na(oxford))
    err("oxford must be a flag")
  TRUE
}
