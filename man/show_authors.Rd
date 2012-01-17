\name{show_authors}
\alias{show_authors}
\title{show of authors on the paper}
\usage{
  show_authors(x)
}
\arguments{
  \item{x}{the list returned from a Mendeley public search
  method}
}
\value{
  a vector of the authors in each of the publications
  included in the returned list
}
\description{
  show of authors on the paper
}
\examples{
\dontrun{
me <- authored("Boettiger")
## exclude others with same last name:
really_me <- subset_by_author(me, "Carl", "Boettiger")
## show co-authors of the searched author, by manuscript
coauthors <- show_authors(me[really_me])
## show unique co-authors
unique(coauthors)
}
}

