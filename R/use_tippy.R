#' Use tippy
#' 
#' Dynamically use tippy.
#' 
#' @param target Target element.
#' @param ... Any option to pass to tippy
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
#'     use_tippy(),
#'     p("Some text", title = "tooltip"),
#'     p("Some text", title = "tooltip"),
#'     p("Some text", title = "tooltip"),
#'     p("Some text", title = "tooltip"),
#'     p("Some text", title = "tooltip"),
#'     p("Some text", title = "tooltip"),
#'     call_tippy("[title]") # all elements with title
#'  ),
#'  server = function(input, output) {}
#' )
#' }
#' 
#' @seealso \href{https://atomiks.github.io/tippyjs/}{official documentation}
#' 
#' @rdname use_tippy
#' @export
use_tippy <- function(){
  
  shiny::addResourcePath("tippy", system.file("htmlwidgets/lib/tippyjs-2.5.2", package = "tippy"))
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src = "tippy/tippy.all.min.js")
      )
    )
  )
}

#' @rdname use_tippy
#' @export
call_tippy <- function(target, ...){
  
  if(missing(target))
    stop("must pass target", call. = FALSE)
  
  opts <- list(...)
  opts <- jsonlite::toJSON(opts, auto_unbox = TRUE, pretty = FALSE)
  
  fn <- paste0("tippy('", target, "',", opts, ")")
  
  shiny::tagList(
    shiny::tags$script(fn)
  )
}