\name{folderDocs}
\alias{folderDocs}
\title{folderDocs - allows authenticated users to retrieve documents within a folder.}
\usage{
  folderDocs(mendeley_cred = NULL, folder_id = NULL,
    page = NULL, items = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

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
  folderDocs - allows authenticated users to retrieve
  documents within a folder.
}
\examples{
\dontrun{
user_folder_documents(mendeley_cred, '22468211')
}
}

