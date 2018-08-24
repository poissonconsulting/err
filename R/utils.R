n_string <- function(n, one, some, none, lots, nlots) {
  if(n == 1) return(one)
  if(n == 0) return(none)
  if(n >= nlots) return(lots)
  some
}
