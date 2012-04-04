\name{createGroup}
\alias{createGroup}
\title{createGroup - Create a new group in the user's library.}
\usage{
  createGroup(mendeley_cred = NULL, group_name = NULL,
    type = "invite", ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{group_name}{Name of your group.}

  \item{type}{Three types of groups are allowed: 'private',
  'invite' and 'open'.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  createGroup - Create a new group in the user's library.
}
\examples{
\dontrun{
user_create_group(...)
}
}

