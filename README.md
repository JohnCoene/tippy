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

# use tooltip on other elements.
library(shiny)

shinyApp(
  ui = fluidPage(
    textInput("input", "input with tooltip"),
    tippy("Some text", tooltip = "Tiiiip"),
    tippy_this("input", "Tooltip", placement = "right")
 ),
 server = function(input, output) {}
)

# dynamic
library(shiny)

shinyApp(
  ui = fluidPage(
    use_tippy(),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    call_tippy("[title]", placement = "top")
 ),
 server = function(input, output) {}
)
```
