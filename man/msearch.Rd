\name{msearch}
\alias{msearch}
\title{msearch.R   Search Method (Public Method)}
\usage{
  msearch(query, page = NA, numItems = 1000L,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/documents/search", query),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{any search query}

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
  all results matching the query for the author
}
\description{
  msearch.R Search Method (Public Method)
}
\examples{
\dontrun{
 a = msearch("bob", , 20)
 d = msearch("bob", 4, 20)
}
}

