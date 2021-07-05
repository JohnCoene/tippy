#' Dependencies
#' 
#' Include dependencies, place anywhere in the shiny UI.
#' 
#' @importFrom shiny singleton tags
#' @importFrom htmltools htmlDependency
#' 
#' @export
useTippy <- function(){
  htmlDependency(
    "tippy",
    version = utils::packageVersion("tippy"),
    package = "tippy",
    src = "packer",
    script = "tippy.js"
  )
}
