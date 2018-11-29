#' Create a tooltip
#'
#' Add tooltips to your document.
#'
#' @param text Element text.
#' @param tooltip Element tooltip.
#' @param element An object of class \code{shiny.tag}.
#' @param elementId \code{string} id as a valid \code{CSS} element id.
#' @param ... Any other options from \href{https://atomiks.github.io/tippyjs/#all-options}{the official documentation}.
#'
#' @examples
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!")
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", placement = "right",
#'   theme = "light")
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", animation = "scale",
#'   duration = 1000, placement = "bottom")
#' tippy("Click me!", tooltip = "Hi, I'm the tooltip!", trigger = "click",
#'   theme = "light")
#' 
#' # use tooltip on other elements.
#' if(interactive()){
#' library(shiny)
#' 
#' shinyApp(
#'   ui = fluidPage(
#'     with_tippy(textInput("input", "input with tooltip"), "Input text", placement = "right")
#'  ),
#'  server = function(input, output) {}
#' )
#' }
#' 
#' @seealso \href{https://atomiks.github.io/tippyjs/}{official documentation}
#'
#' @import htmlwidgets
#' 
#' @rdname tippy
#' @export
tippy <- function(text, tooltip, ..., elementId = NULL) {

  if(missing(tooltip)) stop("must pass tooltip.", call. = FALSE)
  if(missing(text)) stop("must pass text.", call. = FALSE)

  x <- list()
  
  # forward options using x
  x$opts = list(...)
  x$opts$content <- tooltip
  
  if(!missing(text))
    x$text <- text

  # create widget
  .as_widget(x, elementId) 
}

#' @rdname tippy
#' @export
tippy_this <- function(elementId, tooltip, ...){

  .Deprecated("with_tippy", package = "tippy")
  
  if(missing(tooltip)) stop("must pass tooltip.", call. = FALSE)
  if(missing(elementId)) stop("must pass elementId.", call. = FALSE)
  
  x = list(
    element = elementId,
    opts = list(
      content = tooltip,
      ...
    )
  )
  
  # create widget
  .as_widget(x) 
}

#' @rdname tippy
#' @export
with_tippy <- function(element, tooltip, ...){
  
  if(missing(tooltip)) stop("must pass tooltip.", call. = FALSE)
  if(missing(element)) stop("must pass element.", call. = FALSE)
  
  x <- list(
    element = element$attribs$id,
    opts = list(...)
  )
  
  htmltools::tagList(
    shiny::tagAppendAttributes(element, "data-tippy" = tooltip),
    .as_widget(x) 
  )
}

tippy_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = class, ...)
}

#' Shiny bindings for tippy
#'
#' Output and render functions for using tippy within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a tippy
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name tippy-shiny
#'
#' @export
tippyOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'tippy', width, height, package = 'tippy')
}

#' @rdname tippy-shiny
#' @export
renderTippy <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tippyOutput, env, quoted = TRUE)
}
