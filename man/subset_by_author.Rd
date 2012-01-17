\name{subset_by_author}
\alias{subset_by_author}
\title{subset search results by matching author}
\usage{
  subset_by_author(x, surname, forename)
}
\arguments{
  \item{x}{the return of any search function, such as
  "authored" or "tagged"}

  \item{surname}{the surname, will attempt partial
  matching}

  \item{forename}{the author's first name, will attempt
  partial matching}
}
\value{
  a vector indicating where a (partial) match of both first
  and last name has been successful
}
\description{
  get the ids of all the entries where the author's surname
  and forename match the given regular expressions
}
\examples{
\dontrun{
dakos <- authored("V Dakos")
m <- subset_by_author(dakos, "V", "Dakos")
unique(show_titles(dakos[m]))
}
}

