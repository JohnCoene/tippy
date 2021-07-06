#' Use a plot as tooltip
#' 
#' @inheritParams tippyThis
#' @param plotId Id of plot to use.
#' @param .width,.height Dimensions of plot.
#' @param .hidePlot Whether to hide the original plot.
#' @param .session A valid shiny session.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   useTippy(),
#'   plotOutput("plot"),
#'   h5("plot tooltip", id = "plotTip")
#' )
#' 
#' server <- function(input, output) {
#'   output$plot <- renderPlot({
#'     on.exit({
#'       tippy_plot(
#'         "plotTip", 
#'         "plot", 
#'         theme = "light",
#'         .hidePlot = TRUE
#'       )
#'     })
#'     plot(cars)
#'   })
#' }
#' 
#' if(interactive())
#'   shinyApp(ui, server)
#' 
#' @export 
tippy_plot <- function(
	selector,
	plotId,
	...,
	.width = 200,
	.height = 200,
	.hidePlot = FALSE,
	.session = shiny::getDefaultReactiveDomain()
) {
	.session$sendCustomMessage(
		"tippy-plot",
		list(
			hide = .hidePlot,
			plotOptions = list(
				height = .height,
				width = .width
			),
			selector = make_selector(selector),
			target = make_selector(plotId),
			options = list(...)	
		)
	)
}