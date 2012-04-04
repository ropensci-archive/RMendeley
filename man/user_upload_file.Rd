\name{user_upload_file}
\alias{user_upload_file}
\title{Allows authenticated users to attach files to a document in their library. [incomplete]}
\usage{
  user_upload_file(mendeley_cred = NULL, doc, content, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{doc}{...}

  \item{content}{...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  Allows authenticated users to attach files to a document
  in their library. [incomplete]
}
\examples{
\dontrun{
functions is not complete
}
}

