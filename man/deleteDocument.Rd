\name{deleteDocument}
\alias{deleteDocument}
\title{deleteDocument - delete a document from your library.}
\usage{
  deleteDocument(mc = NULL, doc_id = NULL,
    folder_id = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{folder_id}{Id of the folder which contains the
  document to be removed.}

  \item{doc_id}{Id of the document to be removed.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  Deletes from library if no folder is specified. Deletes
  from folder if a folder id is specified.
}
\examples{
\dontrun{
deleteDocument(...)
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

