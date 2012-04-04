\name{addFolderDoc}
\alias{addFolderDoc}
\title{Allows authenticated users to add a document to an specific folder. The document must exists on the library}
\usage{
  addFolderDoc(mendeley_cred = NULL, folder, doc, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{folder}{foo}

  \item{doc}{document...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  Allows authenticated users to add a document to an
  specific folder. The document must exists on the library
}
\examples{
\dontrun{
user_add_doc_folder(mendeley_cred, ...)
}
}

