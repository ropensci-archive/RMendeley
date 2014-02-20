\name{contacts}
\alias{contacts}
\title{contacts - List  of  current Mendeley contacts}
\usage{
contacts(mc = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

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
contacts - List of current Mendeley contacts
}
\examples{
\dontrun{
contacts(mc)
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

