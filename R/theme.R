#' Theme
#' 
#' Convenience function to create a theme.
#' 
#' @param name Name of theme.
#' @param box_bg,box_color,content_bg,content_color Background and text color respectively.
#' @param box_font_size,content_font_size Size of the font.
#' @param arrow_color Color of the arrow (if enabled).
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   useTippy(),
#'   tippyTheme("myTheme", box_bg = "darkred"),
#'   h5("plot tooltip", id = "plotTip"),
#'   tippyThis(
#'     "plotTip",
#'     "Hello world",
#'     theme = "myTheme"
#'   )
#' )
#' 
#' server <- function(input, output) {}
#' 
#' if(interactive())
#'   shinyApp(ui, server)
#' 
#' @importFrom shiny tags
#' 
#' @export 
tippyTheme <- function(
	name, 
	box_bg = "black", 
	box_color = "white",
	box_font_size = "12px",
	arrow_color = box_bg,
	content_bg = box_bg,
	content_color = box_color,
	content_font_size = box_font_size
){

	if(missing(name))
		stop("Missing `name`")

	theme <- sprintf(
		".tippy-box[data-theme~='%s'] {
			background-color: %s;
			color: %s;
			font-size: %s;
		}
		.tippy-box[data-theme~='%s'] > .tippy-arrow {
			color: %s;
		} 
		.tippy-box[data-theme~='%s'] > .tippy-content {
			background-color: %s;
			color: %s;
			font-size: %s;
		}",
		name,
		box_bg,
		box_color,
		box_font_size,
		name,
		arrow_color,
		name,
		content_bg,
		content_color,
		content_font_size
	)

	tags$head(
		HTML(
			sprintf(
				"<style>%s</style>",
				theme
			)
		)
	)
}

#' Theme
#' 
#' Set a global theme. 
#' Every tooltip will subsequently use this theme. 
#' 
#' @param name Name of the theme to set.
#' 
#' @export 
tippy_global_theme <- function(name){
	if(missing(name))
		stop("Missing name", call. = FALSE)
	
	options(TIPPY_THEME = name)
}

get_theme <- function(){
	getOption("TIPPY_THEME", NULL)
}