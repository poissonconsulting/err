n_string <- function(n, one, some, none, lots, nlots) {
  if(n == 1) return(one)
  if(n == 0) return(none)
  if(n >= nlots) return(lots)
  some
}

deparse_object_name <- function(object_name) {
  if (!is.character(object_name)) object_name <- deparse(object_name) 
  if (isTRUE(is.na(object_name))) object_name <- "NA"

  object_name
}
