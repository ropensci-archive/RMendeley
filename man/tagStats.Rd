\name{tagStats}
\alias{tagStats}
\title{tagStats - allows authenticated users to get the most recent tags used in their library}
\usage{
  tagStats(mendeley_cred = NULL, ...,
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
  list with tags
}
\description{
  tagStats - allows authenticated users to get the most
  recent tags used in their library
}
\examples{
\dontrun{
user_tag_stats(mendeley_cred)
}
}

