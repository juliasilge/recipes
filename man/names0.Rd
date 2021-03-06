% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc.R
\name{names0}
\alias{names0}
\alias{dummy_names}
\title{Naming Tools}
\usage{
names0(num, prefix = "x")

dummy_names(var, lvl, ordinal = FALSE, sep = "_")
}
\arguments{
\item{num}{A single integer for how many elements are created.}

\item{prefix}{A character string that will start each name.}

\item{var}{A single string for the original factor name.}

\item{lvl}{A character vectors of the factor levels (in order).
When used with \code{\link[=step_dummy]{step_dummy()}}, \code{lvl} would be the suffixes
that result \emph{after} \code{model.matrix} is called (see the
example below).}

\item{ordinal}{A logical; was the original factor ordered?}

\item{sep}{A single character value for the separator between the names and
levels.}
}
\value{
\code{names0} returns a character string of length \code{num} and
\code{dummy_names} generates a character vector the same length as
\code{lvl},
}
\description{
\code{names0} creates a series of \code{num} names with a common prefix.
The names are numbered with leading zeros (e.g.
\code{prefix01}-\code{prefix10} instead of \code{prefix1}-\code{prefix10}).
\code{dummy_names} can be used for renaming unordered and ordered
dummy variables (in \code{\link[=step_dummy]{step_dummy()}}).
}
\examples{
names0(9, "x")
names0(10, "x")

example <- data.frame(y = ordered(letters[1:5]),
                      z = factor(LETTERS[1:5]))

dummy_names("z", levels(example$z)[-1])

after_mm <- colnames(model.matrix(~y, data = example))[-1]
after_mm
levels(example$y)

dummy_names("y", substring(after_mm, 2), ordinal = TRUE)
}
\concept{naming_functions}
\concept{string_functions}
\keyword{datagen}
