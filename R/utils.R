.as_widget <- function(x, elementId = NULL){
  htmlwidgets::createWidget(
    name = 'tippy',
    x,
    width = NULL,
    height = NULL,
    package = 'tippy',
    elementId = elementId
  )
}