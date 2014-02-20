\name{groupDocInfo}
\alias{groupDocInfo}
\title{groupDocInfo -  Returns metadata for a document in a group.}
\usage{
groupDocInfo(mc = NULL, group_id = NULL, document_id = NULL, ...,
  curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

  \item{group_id}{...}

  \item{document_id}{...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
groupDocInfo - Returns metadata for a document in a group.
}
\examples{
\dontrun{
groupDocInfo(mc,1377653 ,4402412575)
}
}
\author{
Karthik Ram \email{karthik.ram@gmail.com}
}

