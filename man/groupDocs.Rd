\name{groupDocs}
\alias{groupDocs}
\title{groupDocs - returns a list of documents in a group.}
\usage{
  groupDocs(mc = NULL, group_id = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group_id}{Private group ID}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  groupDocs - returns a list of documents in a group.
}
\examples{
\dontrun{
groupDocs(mc, group_id='1377483')
}
}

