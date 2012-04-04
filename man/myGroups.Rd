\name{myGroups}
\alias{myGroups}
\title{myGroups - returns a list of Mendeley groups}
\usage{
  myGroups(mendeley_cred = NULL, ...,
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
  data.frame
}
\description{
  myGroups - returns a list of Mendeley groups
}
\examples{
\dontrun{
mendeley_groups(mendeley_cred)
}
}

