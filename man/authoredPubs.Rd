\name{authoredPubs}
\alias{authoredPubs}
\title{authoredPubs - allows authenticated users to retrieve their own publications.}
\usage{
  authoredPubs(mendeley_cred = NULL, ...,
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
\description{
  authoredPubs - allows authenticated users to retrieve
  their own publications.
}
\examples{
\dontrun{
user_authored_pubs(mendeley_cred)
}
}

