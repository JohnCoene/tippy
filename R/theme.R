#' Theme
#' 
#' Set tippy theme.
#' 
#' @inheritParams tippy
#' 
#' @importFrom htmltools HTML
#' @importFrom jsonlite toJSON
#' 
#' @export 
tippyTheme <- function(...){
	opts <- toJSON(list(...), auto_unbox = TRUE)
	script <- HTML(
		sprintf("tippyr.theme(%s);", opts)
	)
	singleton(
		tags$head(
			script
		)
	)
}