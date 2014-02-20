\name{mendeley_library}
\alias{mendeley_library}
\title{mendeley_library - Returns a list of all the documents in your library.}
\usage{
mendeley_library(mc = NULL, page = NULL, items = NULL, ...,
  curl = getCurlHandle())
}
\arguments{
  \item{mc}{Your Mendeley ROauth credentials.}

  \item{page}{Page number of search results}

  \item{items}{Number of items per page}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
mendeley_library - Returns a list of all the documents in
your library.
}
\examples{
\dontrun{
mendeley_library(mc)
mendeley_library(mc, 2)
mendeley_library(mc, 1, 25)
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

