\name{getGroupID}
\alias{getGroupID}
\title{getGroupID}
\usage{
  getGroupID(mc = NULL, group = NULL, ...,
    curl = getCurlHandle())

  getGroupID(mc = NULL, group = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group}{Group Name}

  \item{...}{additional (optional) parameters}

  \item{curl}{curl handle}

  \item{mc}{<what param does>}

  \item{group}{Name of group}

  \item{...}{<what param does>}

  \item{curl}{= getCurlHandle() <what param does>}
}
\value{
  numeric
}
\description{
  Retrieves Mendeley Group ID from a Mendeley Group Name

  Meant for internal use.
}
\examples{
\dontrun{
getGroupID(mc, "Future of Science")
}
\dontrun{
getGroupID(mc, '')
}
}

