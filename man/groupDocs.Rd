\name{groupDocs}
\alias{groupDocs}
\title{groupDocs - returns a list of group documents.}
\usage{
  groupDocs(mendeley_cred = NULL, group_id = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{group_id}{Private group ID}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  groupDocs - returns a list of group documents.
}
\examples{
\dontrun{
user_group_documents(mendeley_cred, group_id='1377483')
}
}

