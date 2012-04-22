\name{createFolder}
\alias{createFolder}
\title{createFolder - Create a folder in your Mendeley library}
\usage{
  createFolder(mc = NULL, name = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{Your Mendeley OAUth credentials}

  \item{name}{Name of your new folder}

  \item{curl}{Optionsal. If using in a loop, call
  getCurlHandle() first and pass the returned value in here
  (avoids unnecessary footprint)}

  \item{...}{optional additional curl options. Useful for
  debugging purposes.}
}
\value{
  JSON object of class \code{MendeleyFolderID} containing
  your folder ID if successful.
}
\description{
  createFolder - Create a folder in your Mendeley library
}
\examples{
\dontrun{
createFolder(mc, 'folder_name')
}
}

