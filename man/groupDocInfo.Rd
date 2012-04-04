\name{groupDocInfo}
\alias{groupDocInfo}
\title{groupDocInfo -  function will return all available information for a document within a group.}
\usage{
  groupDocInfo(mendeley_cred = NULL, group_id = NULL,
    document_id = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{group_id}{...}

  \item{document_id}{...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  groupDocInfo - function will return all available
  information for a document within a group.
}
\examples{
\dontrun{
user_group_doc_details(mendeley_cred,1377653 ,4402412575)
}
}

