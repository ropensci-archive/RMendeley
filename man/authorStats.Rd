\name{authorStats}
\alias{authorStats}
\title{Returns list of top 5 authors in user library.}
\usage{
  authorStats(mendeley_cred = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

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
  Returns list of top 5 authors in user library.
}
\examples{
\dontrun{
author_stats(mendeley_oauth_cred)
}
}

