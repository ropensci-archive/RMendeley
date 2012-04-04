\name{groupPeople}
\alias{groupPeople}
\title{groupPeople  - returns list of group members and their Mendeley usr IDs}
\usage{
  groupPeople(mendeley_cred = NULL, group_name = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{Your Mendeley OAuth credential.}

  \item{group_name}{Name of group}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\value{
  list
}
\description{
  groupPeople - returns list of group members and their
  Mendeley usr IDs
}
\examples{
\dontrun{
user_group_people(mendeley_cred, '530031')
}
}
\seealso{
  user_groups
}

