% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tippy.R
\name{tippy}
\alias{tippy}
\title{Add a Tooltip to an Element}
\usage{
tippy(element, content, ...)
}
\arguments{
\item{element}{Shiny, or htmltools element, or character string.}

\item{content}{Content of the tooltip.}

\item{...}{Any other options from \href{https://atomiks.github.io/tippyjs/v6/all-props/}{the official documentation}.}
}
\description{
Add tooltips to an element.
}
\examples{
if(FALSE){
 tippy("Hover me!", content = "Hi, I'm the tooltip!")
 tippy(h3("Hello"), content = "World")
}

}
\seealso{
\href{https://atomiks.github.io/tippyjs/}{official documentation}
}
