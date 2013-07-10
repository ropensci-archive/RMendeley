\name{authorStats}
\alias{authorStats}
\title{authorStats - Returns list of top 5 authors in your library.}
\usage{
  authorStats(mc = NULL, ..., curl = getCurlHandle())
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
  List
}
\description{
  authorStats - Returns list of top 5 authors in your
  library.
}
\examples{
\dontrun{
authorStats(mendeley_oauth_cred)
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

