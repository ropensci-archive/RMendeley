\name{tagStats}
\alias{tagStats}
\title{tagStats - allows authenticated users to get the most recent tags used in their library}
\usage{
  tagStats(mc = NULL, ..., curl = getCurlHandle())
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
  list with tags
}
\description{
  tagStats - allows authenticated users to get the most
  recent tags used in their library
}
\examples{
\dontrun{
tagStats(mc)
}
}

