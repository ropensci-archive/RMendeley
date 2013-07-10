\name{getFolderID}
\alias{getFolderID}
\title{getFolderID - retrieves Folder ID from folder name}
\usage{
  getFolderID(mc = NULL, name, ..., curl = getCurlHandle())
}
\arguments{
  \item{mc}{Your Mendeley ROAuth credential.}

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
getFolderID(mc, 'folder_name')
}
}

