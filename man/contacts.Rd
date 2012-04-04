\name{contacts}
\alias{contacts}
\title{contacts- List Mendeley contacts}
\usage{
  contacts(mendeley_cred = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

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
  contacts- List Mendeley contacts
}
\examples{
\dontrun{
user_contacts(mendeley_cred)
}
}

