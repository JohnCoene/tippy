#' Create a tooltip
#'
#' Add tooltips to your document.
#'
#' @param text Element text.
#' @param tooltip Element tooltip.
#' @param position Specifies which direction to position the tooltip on the element.
#'          Valid values are \code{top}, \code{bottom}, \code{left}, \code{right}.
#' @param height,width height and width of sparkline htmlwidget
#'          specified in any valid \code{CSS} size unit.
#' @param trigger Specifies which type of events will trigger a tooltip to show. Separate each by a space.
#'          \code{mouseenter} is for hovering and touch on mobile, and \code{focus} is for keyboard navigation.
#'          Valid values are \code{mouseenter}, \code{focus}, \code{click}, \code{manual}.
#' @param elementId \code{string} id as a valid \code{CSS} element id.
#' @param interactive Makes a tooltip interactive, i.e. will not close when the user hovers over or clicks on the tooltip.
#'          This lets you create a popover (similar to Bootstrap) when used in conjunction with a click trigger.
#'          Defaults to \code{FALSE}.
#' @param interactiveBorder Specifies the size of the invisible border around an interactive tooltip that will prevent
#'          it from closing. Only applies to mouseenter triggered tooltips. Defaults to \code{2}.
#' @param delay Specifies how long it takes after a trigger event is fired for a tooltip to show. Defaults to \code{0}.
#' @param hideDelay Specifies how long it takes after a leave event is fired for a tooltip to hide.
#'          Does not apply when clicking on the document to hide tooltips. Defaults to \code{0}.
#' @param animation Specifies the type of transition animation a tooltip has. Defaults to \code{shift}.
#'          Valid values \code{shift}, \code{perspective}, \code{fade}, \code{scale}.
#' @param arrow Adds an arrow pointing to the tooltipped element. Setting this to \code{TRUE} disables \code{animateFill},
#'          defaults to \code{FALSE}.
#' @param arrowSize Specifies how big the tooltip's arrow is. Defaults to \code{regular}.
#'          Valid values are \code{regular}, \code{small}, \code{big}.
#' @param animateFill Adds a material design-esque filling animation. This is disabled if you have \code{arrow} set to \code{TRUE}.
#' @param duration Specifies how long the transition animation takes to complete when showing a tooltip. Defaults to \code{375}.
#' @param hideDuration Specifies how long the transition animation takes to complete when hiding a tooltip.
#'          If \code{null} defaults to \code{duration}.
#' @param html Allows you to add HTML to a tooltip. Default to \code{FALSE}.
#' @param size Specifies how big the tooltip is. Defaults to \code{regular}. Valid values \code{regular}, \code{small}, \code{big}.
#' @param distance Specifies how far away the tooltip is from its element. Defaults to \code{10}.
#' @param theme The CSS styling theme. You can add your own easily. Defaults to \code{dark}.
#'          Valid values are \code{dark}, \code{light}, \code{transparent}.
#' @param offset ffsets the tooltip on its opposite axis.
#'          For position top and bottom, it acts as offsetX. For position left and right, it acts as offsetY.
#'          Defaults to \code{0}.
#' @param hideOnClick Specifies whether to hide a tooltip upon clicking its element after hovering over and when clicking elsewhere on the document.
#'          For click-triggered tooltips when using \code{FALSE}, toggle functionality remains unless you use \code{persistent}.
#' @param multiple Specifies whether to allow multiple tooltips open on the page (click trigger only). Defaults to \code{FALSE}.
#' @param followCursor Specifies whether to follow the user's mouse cursor (mouse devices only). Defaults to \code{FALSE}.
#' @param inertia Modifies the \code{transition-timing-function} with a cubic bezier to create a "slingshot" intertial effect.
#'          Defaults to \code{FALSE}.
#' @param flipDuration Specifies the transition duration between flips and when updating a tooltip's position on window resize.
#'          Defaults to \code{300}.
#' @param sticky Specifies whether the tooltip should stick to its element reference when it's showing
#'          (for example, if the element is animated/moves).
#'          Defaults to \code{FALSE}.
#' @param stickyDuration Specifies the 'smoothing' transition when the popper's position updates as its element moves.
#'          Defaults to \code{200}.
#' @param zIndex Specifies the z-index of the tooltip popper. Defaults to \code{9999}.
#' @param touchHold Changes the trigger behavior on touch devices.
#'          It will change it from a tap to show and tap off to hide, to a tap and hold to show, and a release to hide.
#'          Defaults to \code{FALSE}.
#'
#' @examples
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!")
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", position = "right",
#'   theme = "light")
#' tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", animation = "scale",
#'   duration = 1000, position = "bottom")
#' tippy("Click me!", tooltip = "Hi, I'm the tooltip!", trigger = "click",
#'   theme = "light")
#'
#' @import htmlwidgets
#'
#' @export
tippy <- function(text, tooltip, position = "top", animation = "shift", trigger = "mouseenter focus",
                  interactive = FALSE, interactiveBorder = 2, delay = 0, hideDelay = 0,
                  arrow = FALSE, arrowSize = "regular", animateFill = TRUE,
                  duration = 375, hideDuration = NULL, html = FALSE, size = "regular",
                  distance = 10, theme = "dark", offset = 0, hideOnClick = TRUE, multiple = FALSE,
                  followCursor = FALSE, inertia = FALSE, flipDuration = 300,
                  sticky = FALSE, stickyDuration = 200, zIndex = 9999, touchHold = FALSE,
                  width = NULL, height = NULL, elementId = NULL) {

  if(missing(text) && is.null(html)) stop("must pass text")
  if(missing(tooltip)) stop("must pass tooltip")

  jsbool <- function(x) ifelse(isTRUE(x), "true", "false")

  # forward options using x
  x = list(
    text = text,
    tooltip = tooltip,
    position = position,
    animation = animation,
    trigger = trigger,
    interactive = jsbool(interactive),
    interactiveBorder = interactiveBorder,
    delay = delay,
    hideDelay = hideDelay,
    arrow = jsbool(arrow),
    arrowSize = arrowSize,
    animateFill = jsbool(animateFill),
    duration = duration,
    hideDuration = ifelse(is.null(hideDuration), duration , hideDuration),
    html = jsbool(html),
    distance = distance,
    theme = theme,
    offset = offset,
    hideOnClick = jsbool(hideOnClick),
    multiple = jsbool(multiple),
    followCursor = jsbool(followCursor),
    inertia = jsbool(inertia),
    flipDuration = flipDuration,
    sticky = jsbool(sticky),
    stickyDuration = jsbool(stickyDuration),
    zIndex = zIndex,
    touchHold = jsbool(touchHold)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'tippy',
    x,
    width = width,
    height = height,
    package = 'tippy',
    elementId = elementId
  )
}

tippy_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = class, ...)
}

#' Shiny bindings for tippy
#'
#' Output and render functions for using tippy within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a tippy
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name tippy-shiny
#'
#' @export
tippyOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'tippy', width, height, package = 'tippy')
}

#' @rdname tippy-shiny
#' @export
renderTippy <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tippyOutput, env, quoted = TRUE)
}
