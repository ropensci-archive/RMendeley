\name{deleteGroup}
\alias{deleteGroup}
\title{deleteGroup - Delete a group for which you have owner permissions.}
\usage{
  deleteGroup(mc, group, ask = TRUE, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group}{group id.}

  \item{ask}{logical. Default is TRUE to verify deletion.
  To skip this step, set ask to FALSE.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  deleteGroup - Delete a group for which you have owner
  permissions.
}
\examples{
\dontrun{
deleteGroup(mc, 'group name')
}
}

