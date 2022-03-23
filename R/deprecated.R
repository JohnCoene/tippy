#' Use tippy
#' 
#' __Deprecated.__ Dynamically use tippy.
#' 
#' @param class Class of elements to apply tooltip to.
#' @param ... Any option from \href{https://atomiks.github.io/tippyjs/#all-options}{the official documentation}.
#' @param tooltip Content of tooltip.
#' @inheritParams tippy
#' 
#' @section Functions:
#' \itemize{
#'   \item{\code{use_tippy} Includes tippy.js in header.}
#'   \item{\code{call_tippy} call \code{tippy} on specific target element(s), place after elements to be targeted.}
#' }
#' 
#' @examples 
#' library(shiny)
#' 
#' if(interactive()){
#' shinyApp(
#'   ui = fluidPage(
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     tippy("tooltip", content = "Hi!") # all elements with class
#'  ),
#'  server = function(input, output) {}
#' )
#' }
#' 
#' @seealso \href{https://atomiks.github.io/tippyjs/}{official documentation}
#' 
#' @name deprecated
#' @export
use_tippy <- function(){
  .Deprecated("useTippy", "tippy")
  useTippy()
}

#' @rdname deprecated
#' @export
tippy_class <- function(class, ...){
  .Deprecated("tippy", package = "tippy")
  tippy(
    sprintf(".%s", class),
    ...
  )
}

#' @rdname deprecated
#' @export
with_tippy <- function(element, tooltip, ...){
  .Deprecated("tippy", "tippy", "Deprecated: Use the tippy function")

  opts <- list(element, content = tooltip, ...)
  do.call("tippy", opts)
}

#' @rdname tippyThis
#' @export
tippy_this <- function(selector, content = NULL, ...){
  .Deprecated("tippyThis", "tippy")  
  tippyThis(selector, content, ...)
}
