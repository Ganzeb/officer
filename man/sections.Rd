% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docx_section.R
\name{sections}
\alias{sections}
\alias{body_end_section_continuous}
\alias{body_end_section_landscape}
\alias{body_end_section_portrait}
\alias{body_end_section_columns}
\alias{body_end_section_columns_landscape}
\title{sections}
\usage{
body_end_section_continuous(x)

body_end_section_landscape(x, w = 21/2.54, h = 29.7/2.54)

body_end_section_portrait(x, w = 21/2.54, h = 29.7/2.54)

body_end_section_columns(x, widths = c(2.5, 2.5), space = 0.25, sep = FALSE)

body_end_section_columns_landscape(
  x,
  widths = c(2.5, 2.5),
  space = 0.25,
  sep = FALSE,
  w = 21/2.54,
  h = 29.7/2.54
)
}
\arguments{
\item{x}{an rdocx object}

\item{w, h}{width and height in inches of the section page. This will
be ignored if the default section (of the \code{reference_docx} file)
already has a width and a height.}

\item{widths}{columns widths in inches. If 3 values, 3 columns
will be produced.}

\item{space}{space in inches between columns.}

\item{sep}{if TRUE a line is separating columns.}
}
\description{
Add sections in a Word document. A section affects
preceding paragraphs or tables.
}
\details{
A section starts at the end of the previous section (or the beginning of
the document if no preceding section exists), and stops where the section is declared.
}
\examples{
library(magrittr)

str1 <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " \%>\%
  rep(5) \%>\% paste(collapse = "")
str2 <- "Aenean venenatis varius elit et fermentum vivamus vehicula. " \%>\%
  rep(5) \%>\% paste(collapse = "")

my_doc <- read_docx()  \%>\%
  body_add_par(value = "Default section", style = "heading 1") \%>\%
  body_add_par(value = str1, style = "centered") \%>\%
  body_add_par(value = str2, style = "centered") \%>\%

  body_end_section_continuous() \%>\%
  body_add_par(value = "Landscape section", style = "heading 1") \%>\%
  body_add_par(value = str1, style = "centered") \%>\%
  body_add_par(value = str2, style = "centered") \%>\%
  body_end_section_landscape() \%>\%

  body_add_par(value = "Columns", style = "heading 1") \%>\%
  body_end_section_continuous() \%>\%
  body_add_par(value = str1, style = "centered") \%>\%
  body_add_par(value = str2, style = "centered") \%>\%
  slip_in_column_break() \%>\%
  body_add_par(value = str1, style = "centered") \%>\%
  body_end_section_columns(widths = c(2,2), sep = TRUE, space = 1) \%>\%

  body_add_par(value = str1, style = "Normal") \%>\%
  body_add_par(value = str2, style = "Normal") \%>\%
  slip_in_column_break() \%>\%
  body_end_section_columns_landscape(widths = c(3,3), sep = TRUE, space = 1)

print(my_doc, target = tempfile(fileext = ".docx"))
}
