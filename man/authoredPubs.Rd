\name{authoredPubs}
\alias{authoredPubs}
\title{authoredPubs - allows authenticated users to retrieve their own publications.}
\usage{
  authoredPubs(mc = NULL, ..., curl = getCurlHandle())
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
  authoredPubs - allows authenticated users to retrieve
  their own publications.
}
\examples{
\dontrun{
authoredPubs(mc)
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

