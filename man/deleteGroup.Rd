\name{deleteGroup}
\alias{deleteGroup}
\title{deleteGroup - The following methods will essentially delete a group from the user's library.}
\usage{
  deleteGroup(mendeley_cred = NULL, group = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{group}{group id.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  deleteGroup - The following methods will essentially
  delete a group from the user's library.
}
\examples{
\dontrun{
user_delete_group(mendeley_cred, ...)
}
}

