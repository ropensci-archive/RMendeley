\name{pubStats}
\alias{pubStats}
\title{pubStats - returns list of top 20 publication outlets in your library.}
\usage{
pubStats(mc = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
pubStats - returns list of top 20 publication outlets in
your library.
}
\examples{
\dontrun{
user_pub_stats(...)
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

