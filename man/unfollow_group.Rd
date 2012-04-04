\name{unfollow_group}
\alias{unfollow_group}
\title{The following methods will essentially delete a group from the user's library.}
\usage{
  unfollow_group(mendeley_cred = NULL, group = NULL, ...,
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
  The following methods will essentially delete a group
  from the user's library.
}
\examples{
\dontrun{
user_delete_group(mendeley_cred, ...)
}
}

