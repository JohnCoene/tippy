#' Add a Tooltip to an Element
#'
#' Add tooltips to an element.
#'
#' @param element Shiny, or htmltools element, or character string.
#' @param content Content of the tooltip.
#' @param ... Any other options from \href{https://atomiks.github.io/tippyjs/v6/all-props/}{the official documentation}.
#'
#' @examples
#' library(shiny)
#' 
#' tippy("Hover me!", content = "Hi, I'm the tooltip!")
#' tippy(h3("Hello"), content = "World")
#' 
#' @seealso \href{https://atomiks.github.io/tippyjs/}{official documentation}
#'
#' @importFrom htmltools span browsable tagAppendAttributes HTML
#' @importFrom htmltools tagList html_print
#' @importFrom jsonlite toJSON
#' 
#' @name tippy
#' @export
tippy <- function(element, content, ...) {

  if(missing(content)) 
    stop("Must pass content", call. = FALSE)
  
  if(missing(element)) 
    stop("Must pass element", call. = FALSE)
  
  if(inherits(element, "shiny.tag.list"))
    stop("Cannot assign tooltip to `tagList`", call. = FALSE)

  if(!inherits(element, "shiny.tag"))
    element <- span(element[1], id = random_id())

  id <- element$attribs$id

  if(is.null(id)){
    id <- random_id()
    element <- tagAppendAttributes(element, id = id)
  }

  script <- .tippy_this(id, content = content, ...) 

  el <- tagList(
    useTippy(),
    element,
    script
  )

  structure(el, class = c("tippy", class(el)))
}

#' @export 
print.tippy <- function(x, ...){
  html_print(x)
  invisible(x)
}

#' Bind Tooltip to a Selector
#' 
#' Binds a tooltip to a valid CSS selector.
#' 
#' @inheritParams tippy
#' @param selector A CSS selector, e.g.: `#id` or
#' `.class`. If it is a bare selector (e.g.: `sth`)
#' then it is assumed to be an id and processed as
#' `#sth`. Set `.is_tag` to `TRUE` to disable that.
#' @param .is_tag Whether the selector is a tag,
#' e.g.: `<p>`.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'  tippy(h3("Hello"), "World"),
#'  h4("World", id = "theId"),
#'  tippyThis("theId", "A tooltip")
#' )
#' 
#' server <- function(input, output) {}
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @name tippyThis
#' @export
tippyThis <- function(selector, content = NULL, ..., .is_tag = FALSE){
  
  if(missing(selector)) 
    stop("must pass selector", call. = FALSE)
  
  tagList(
    useTippy(),
    .tippy_this(
      selector = selector, 
      content = content, 
      ...,
      .is_tag = .is_tag
    )
  )
}
