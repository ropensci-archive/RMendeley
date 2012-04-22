\name{groupPeople}
\alias{groupPeople}
\title{groupPeople  - returns list of group members and their Mendeley user IDs}
\usage{
  groupPeople(mc = NULL, group_name = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{Your Mendeley OAuth credential.}

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
  Mendeley user IDs
}
\examples{
\dontrun{
groupPeople(mc, 'Future of Science')
}
}
\seealso{
  user_groups
}

