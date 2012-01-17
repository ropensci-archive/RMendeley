\name{show_titles}
\alias{show_titles}
\title{show of titles of the returned papers}
\usage{
  show_titles(x)
}
\arguments{
  \item{x}{the list returned from a Mendeley public search
  method}
}
\value{
  a vector of the titles in each of the publications
  included in the returned list
}
\description{
  show of titles of the returned papers
}
\examples{
\dontrun{
dakos <- authored("Dakos")
m <- subset_by_author(dakos, "V", "Dakos")
unique(show_titles(dakos[m]))
}
}

