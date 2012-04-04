\name{Folders}
\alias{Folders}
\title{Folders - retuns a list of your Mendeley folders with sizes}
\usage{
  Folders(mendeley_cred = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{Your Mendeley ROAuth credential.}

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
  sizes
}
\examples{
\dontrun{
user_folders(mendeley_cred)
}
}

