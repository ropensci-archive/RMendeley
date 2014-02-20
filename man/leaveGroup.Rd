\name{leaveGroup}
\alias{leaveGroup}
\title{The following methods will quit membership from a group}
\usage{
leaveGroup(mc = NULL, group = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group}{group id.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
The following methods will quit membership from a group
}
\examples{
\dontrun{
leaveGroup(mc, ...)
}
}

