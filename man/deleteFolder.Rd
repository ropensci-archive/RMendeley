\name{deleteFolder}
\alias{deleteFolder}
\title{deleteFolder - allows authenticated users to remove a folder from their library. Documents contained in the id.}
\usage{
  deleteFolder(mendeley_cred = NULL, name = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{name}{name of folder to be removed}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  <longer description>
}
\examples{
\dontrun{
deleteFolder(...)
}
}

