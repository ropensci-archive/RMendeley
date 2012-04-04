\name{user_download_file}
\alias{user_download_file}
\title{User download file (not working because docInfo does not return file hash)}
\usage{
  user_download_file(mendeley_cred = NULL, doc, file = NA,
    binary = NA, ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{doc}{<what param does>}

  \item{file}{<what param does>}

  \item{binary}{logical. Set TRUE for binary files.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  User download file (not working because docInfo does not
  return file hash)
}
\examples{
\dontrun{
user_download_file(mendeley_cred, ....)
}
}

