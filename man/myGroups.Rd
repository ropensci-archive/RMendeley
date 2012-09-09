\name{myGroups}
\alias{myGroups}
\title{myGroups - returns a list of Mendeley groups that you belong to.}
\usage{
  myGroups(mc = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\value{
  data.frame
}
\description{
  myGroups - returns a list of Mendeley groups that you
  belong to.
}
\examples{
\dontrun{
myGroups(mc)
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

