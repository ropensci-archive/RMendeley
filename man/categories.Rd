\name{categories}
\alias{categories}
\title{Returns a list of Mendeley's categories}
\usage{
  categories(key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = "http://api.mendeley.com/oapi/documents/categories/",
    ..., curl = getCurlHandle())
}
\arguments{
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
  Returns a list of Mendeley's categories
}
\examples{
\dontrun{
 categories()
}
}
\keyword{method}
\keyword{public}
\keyword{stats}

