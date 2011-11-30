\name{details}
\alias{details}
\title{details Search Method (Public Method)}
\usage{
  details(query,
    type = c("mendeley", "arxiv", "doi", "isbn", "pmid", "scopus", "ssm"),
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/documents/details", query),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{an object identifer of type identified by
  type}

  \item{type}{the type of object identifier to use}

  \item{url}{Mendeley API URL (don't change this)}

  \item{key}{Mendeley API key (otherwise will try and load
  from server)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}
}
\value{
  the details of the paper being queried
}
\description{
  details Search Method (Public Method)
}
\examples{
\dontrun{
ali <- details("10.1073/pnas.0810311106", type="doi")
 a <- details("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid
}
}

