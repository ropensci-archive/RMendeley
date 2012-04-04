\name{docInfo}
\alias{docInfo}
\title{docInfo - returns citation info for a specific paper}
\usage{
  docInfo(mendeley_cred = NULL, id = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{id}{Document id (retrieved with /oapi/library/)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  returns citation info for a specific paper, such as
  authors, user tags, publication outlet, year, abstract,
  PubMed ID if available, etc.
}
\examples{
\dontrun{
user_doc_details(mendeley_cred, '4388654895')
}
}

