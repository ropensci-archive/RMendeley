\name{folderDocs}
\alias{folderDocs}
\title{folderDocs - Returns list of documents in a specific folder.}
\usage{
  folderDocs(mc = NULL, folder_id = NULL, page = NULL,
    items = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{folder_id}{...}

  \item{page}{...}

  \item{items}{...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  folderDocs - Returns list of documents in a specific
  folder.
}
\examples{
\dontrun{
folderDocs(mc, '22468211')
}
}

