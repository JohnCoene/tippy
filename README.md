[![Build Status](https://travis-ci.org/JohnCoene/tippy.svg?branch=master)](https://travis-ci.org/JohnCoene/tippy)

# tippy

[Tippy.js](https://atomiks.github.io/tippyjs) R htmlwidget.

## Install

```r
devtools::install_github("JohnCoene/tippy")
```

## [Documentation](http://tippy.john-coene.com/)

## Examples

```r
# standard
tippy("Hover me!", tooltip = "Hi, I'm the tooltip!")

tippy("Hover me!", 
  tooltip = "Hi, I'm the tooltip!", 
  position = "right",
  theme = "light")

tippy("Hover me!", 
  tooltip = "Hi, I'm the tooltip!", 
  animation = "scale",
  duration = 1000, position = "bottom")

tippy("Click me!", 
  tooltip = "Hi, I'm the tooltip!", 
  trigger = "click",
  theme = "light")

# in shiny
library(shiny)

ui <- fluidPage(
  br(), br(), br(),
  fluidRow(column(12, tippy("Standard tooltip", tooltip = "The tooltip"))),
  fluidRow(column(12, textInput("inputId", "text"))),
  tippy(element = "inputId", tooltip =  "Tooltip on other element")
)

server <- function(input, output){}

shinyApp(ui, server)
```
