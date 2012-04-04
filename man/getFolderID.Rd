\name{getFolderID}
\alias{getFolderID}
\title{getFolderID - retrieves Folder ID from folder name}
\usage{
  getFolderID(mendeley_cred = NULL, name, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{Your Mendeley ROAuth credential.}

  \item{name}{Folder name}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  getFolderID - retrieves Folder ID from folder name
}
\examples{
\dontrun{
getFolderID(mendeley_cred, 'folder_name')
}
}

