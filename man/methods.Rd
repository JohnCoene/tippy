% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tippy.R
\name{methods}
\alias{methods}
\alias{tippy_disable}
\alias{tippy_enable}
\alias{tippy_destroy}
\alias{tippy_show}
\alias{tippy_hide}
\title{Methods}
\usage{
tippy_disable(
  selectors = NULL,
  .session = shiny::getDefaultReactiveDomain(),
  .is_tag = FALSE
)

tippy_enable(
  selectors = NULL,
  .session = shiny::getDefaultReactiveDomain(),
  .is_tag = FALSE
)

tippy_destroy(
  selectors = NULL,
  .session = shiny::getDefaultReactiveDomain(),
  .is_tag = FALSE
)

tippy_show(
  selectors = NULL,
  .session = shiny::getDefaultReactiveDomain(),
  .is_tag = FALSE
)

tippy_hide(
  selectors = NULL,
  .session = shiny::getDefaultReactiveDomain(),
  .is_tag = FALSE
)
}
\arguments{
\item{selectors}{Selectors of tooltips to
apply the method. If `NULL` then the method
is applied to _all tooltips._}

\item{.session}{A valid shiny session.}

\item{.is_tag}{Whether `selectors` are tags,
e.g.: `<p>`.}
}
\description{
Call tippy methods on tooltips.
}
\examples{
library(shiny)
library(tippy)

ui <- fluidPage(
  useTippy(),
  h5("plot tooltip", class = "tip"),
  p("Another tooltip", class = "tip"),
  tippyThis(
    ".tip",
    "This is indeed a tooltip"
  ),
  actionButton("disable", "Disable"),
  actionButton("enable", "Enable")
)

server <- function(input, output) {
  observeEvent(input$disable, {
    tippy_disable()
  });

  observeEvent(input$enable, {
    tippy_enable()
  })
}

if(FALSE) {
 shinyApp(ui, server)
}

}
