\name{mendeley_library}
\alias{mendeley_library}
\title{mendeley_library - allows authenticated users to retrieve all the documents in their library.}
\usage{
  mendeley_library(mendeley_cred = NULL, page = NULL,
    items = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{Your Mendeley ROauth credentials.}

  \item{page}{Page number of search results}

  \item{items}{Number of items per page}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  mendeley_library - allows authenticated users to retrieve
  all the documents in their library.
}
\examples{
\dontrun{
user_library(mendeley_cred)
user_library(mendeley_cred, 2)
user_library(mendeley_cred, 1, 25)
}
}

