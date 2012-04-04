\name{getGroupID}
\alias{getGroupID}
\title{Get a Group ID from group name}
\usage{
  getGroupID(mendeley_cred = NULL, group = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{<what param does>}

  \item{group}{Name of group}

  \item{...}{<what param does>}

  \item{curl}{= getCurlHandle() <what param does>}
}
\value{
  numeric
}
\description{
  Meant for internal use.
}
\examples{
\dontrun{
getGroupID(mendeley_cred, '')
}
}

