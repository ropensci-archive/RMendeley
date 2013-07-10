\name{subcategories}
\alias{subcategories}
\title{Returns a list of Mendeley's subcategories}
\usage{
  subcategories(cat,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/documents/subcategories/", cat),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{cat}{subject category id}

  \item{key}{Mendeley API key (otherwise will try and load
  from server)}

  \item{url}{Mendeley API URL (don't change this)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}
}
\description{
  Returns a list of Mendeley's subcategories
}
\examples{
\dontrun{
 subcategories()
}
}
\keyword{method}
\keyword{public}
\keyword{stats}

