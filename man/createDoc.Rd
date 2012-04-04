\name{createDoc}
\alias{createDoc}
\title{createDocument - Creates a new document in the user's library or a group. [not working]}
\usage{
  createDoc(mendeley_cred = NULL, doc, type = "Thesis",
    title = "title", ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{doc}{...}

  \item{type}{type of group. Can be public, private or
  invite.}

  \item{title}{title of group document.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  <longer description>
}
\examples{
\dontrun{
user_create_document(mendeley_cred, ....)
}
}

