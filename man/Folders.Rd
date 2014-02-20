\name{Folders}
\alias{Folders}
\title{Folders - retuns a list of your Mendeley folders with sizes.}
\usage{
Folders(mc = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{Your Mendeley ROAuth credential.}

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
Folders - retuns a list of your Mendeley folders with
sizes.
}
\examples{
\dontrun{
Folders(mc)
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

