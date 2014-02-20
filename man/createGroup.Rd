\name{createGroup}
\alias{createGroup}
\title{createGroup - Create a new group in your Mendeley library.}
\usage{
createGroup(mc = NULL, group_name = NULL, type = "invite", ...,
  curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

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
createGroup - Create a new group in your Mendeley library.
}
\examples{
\dontrun{
createGroup(mc, 'new_group_name')
createGroup(mc, 'new_group_name', type="open")
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

