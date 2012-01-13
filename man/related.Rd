\name{related}
\alias{related}
\title{related.R a Search Method (Public Method)}
\usage{
  related(query, page = NA, numItems = 1000L,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/documents/related", query),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{any Mendeley uuid (see details() function)}

  \item{page}{number pages to return (optional)}

  \item{numItems}{number of hits to return (optional)}

  \item{key}{Mendeley API key (otherwise will try and load
  from package)}

  \item{url}{the Mendeley API url for the function (should
  be left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  all results matching the query related =
}
\description{
  Return a list of papers related to a given Mendeley uuid
}
\details{
  See
  \url{http://apidocs.mendeley.com/home/public-resources/search-related}
}
\examples{
\dontrun{
b <- related("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid
}
}

