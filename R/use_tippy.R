#' Use tippy
#' 
#' Dynamically use tippy.
#' 
#' @param target Target element.
#' @param class Class of elements to apply tooltip to.
#' @param ... Any option from \href{https://atomiks.github.io/tippyjs/#all-options}{the official documentation}.
#' 
#' @section Functions:
#' \itemize{
#'   \item{\code{use_tippy} Includes tippy.js in header.}
#'   \item{\code{call_tippy} call \code{tippy} on specific target element(s), place after elements to be targeted.}
#' }
#' 
#' @examples 
#' if(interactive()){
#' library(shiny)
#' 
#' shinyApp(
#'   ui = fluidPage(
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     p("Some text", class = "tooltip"),
#'     tippy_class("tooltip", content = "Hi!") # all elements with class
#'  ),
#'  server = function(input, output) {}
#' )
#' }
#' 
#' @seealso \href{https://atomiks.github.io/tippyjs/}{official documentation}
#' 
#' @name use_tippy_funcs
#' @export
use_tippy <- function(){

  warning("This function is no longer necessary.")
  
  shiny::addResourcePath("tippy", system.file("htmlwidgets/lib/tippy", package = "tippy"))
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src = "tippy/tippy.all.min.js")
      )
    )
  )
}

#' @rdname use_tippy_funcs
#' @export
call_tippy <- function(target, ...){

  .Deprecated("tippy_class", package = "tippy")
  
  if(missing(target))
    stop("must pass target", call. = FALSE)
  
  opts <- list(...)
  opts <- jsonlite::toJSON(opts, auto_unbox = TRUE, pretty = FALSE)
  
  fn <- paste0("document.onreadystatechange = function () {
                    tippy('", target, "',", opts, ");
               }")
  
  shiny::tagList(
    shiny::tags$script(fn)
  )
}

#' @rdname use_tippy_funcs
#' @export
tippy_class <- function(class, ...){
  
  if(missing(class))
    stop("missing class", call. = FALSE)
  
  x <- list(
    class = class,
    opts = list(...)
  )

  # create widget
  .as_widget(x) 
}