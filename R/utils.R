#' Generate a Random Id
#' @keywords internal
random_id <- function(){
  x <- sample(c(letters, 1:9), 20)
  x <- paste0(x, collapse = "")
  sprintf("tippy-%s", x)
}

# use by is_selector
selectors <- c(".", "#", ":", "[")
pattern <- paste0("\\", selectors, collapse = "|")

#' Is Selector
#' 
#' Check whether the input is a valid selector
#' assuming it's a tag selector.
#' 
#' @param selector Selector to check.
#' 
#' @keywords internal
is_selector <- function(selector){
  grepl(pattern, selector)
}

#' Make Selector
#' 
#' @param selector Selector.
#' @param .is_tag Do not pre-process selector.
#' 
#' @return Valid selector.
#' 
#' @keywords internal
make_selector <- function(selector, .is_tag = FALSE){
  if(.is_tag)
    return(selector)
  
  if(is_selector(selector))
    return(selector)

  sprintf("#%s", selector)
}

#' Tippy an element from its selector
#' @keywords internal
.tippy_this <- function(selector, ..., .is_tag = FALSE){
  opts <- list(
    selector = make_selector(selector, .is_tag), 
    options = dropNulls(list(...))
  )
  print(opts)
  opts <- toJSON(opts, auto_unbox = TRUE)
  opts <- as.character(opts)
  HTML(
    sprintf("<script>tippyr.callTippy(%s);</script>", opts)
  )
}

dropNulls <- function (x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}