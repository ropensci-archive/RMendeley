\name{deleteFolder}
\alias{deleteFolder}
\title{deleteFolder - Delete a existing folder from your Mendeley library.}
\usage{
  deleteFolder(mc = NULL, name = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{name}{name of folder to be removed}

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
deleteFolder(mc, 'folder_name')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

