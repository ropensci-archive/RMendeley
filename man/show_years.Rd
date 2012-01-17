\name{show_years}
\alias{show_years}
\title{show of titles of the returned papers}
\usage{
  show_years(x)
}
\arguments{
  \item{x}{the list returned from a Mendeley public search
  method}
}
\value{
  a vector of the years in each of the publications
  included in the returned list
}
\description{
  show of titles of the returned papers
}
\examples{
\dontrun{
dakos <- authored("Dakos")
m <- subset_by_author(dakos, "V", "Dakos")
histogram(show_years(dakos[m]))
}
}

