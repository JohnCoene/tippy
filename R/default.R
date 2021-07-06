#' Default
#' 
#' Set tippy defaults that will be shared
#' by all other tooltips.
#' 
#' @inheritParams tippy
#' 
#' @importFrom htmltools HTML
#' @importFrom jsonlite toJSON
#' 
#' @export 
tippyDefault <- function(...){
	opts <- toJSON(list(...), auto_unbox = TRUE)
	script <- HTML(
		sprintf("tippyr.defaultProps(%s);", opts)
	)
	singleton(
		tags$head(
			script
		)
	)
}