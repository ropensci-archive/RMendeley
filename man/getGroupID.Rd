\name{getGroupID}
\alias{getGroupID}
\title{Get a Group ID from group name}
\usage{
getGroupID(mc = NULL, group = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group}{Group Name}

  \item{...}{additional (optional) parameters}

  \item{curl}{the curl handle}
}
\value{
numeric

group id
}
\description{
Meant for internal use.

getGroupID function
}
\examples{
\dontrun{
getGroupID(mc, '')
}
\dontrun{
getGroupID(mc, "Future of Science")
}
}

