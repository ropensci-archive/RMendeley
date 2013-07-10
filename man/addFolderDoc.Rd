\name{addFolderDoc}
\alias{addFolderDoc}
\title{Allows authenticated users to add a document to an specific folder. The document must exists on the library}
\usage{
  addFolderDoc(mc = NULL, folder, doc, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{folder}{Folder Name}

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
addFolderDoc(mc, '23423', '12321312')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

