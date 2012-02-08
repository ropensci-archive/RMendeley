\name{msearch}
\alias{msearch}
\title{msearch.R   Search Method (Public Method)}
\usage{
  msearch(query, page = NA, numItems = 1000L,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{any search query. Can use the options:
  authors, year, title, published_in, followed by colons
  e.g. authors:Alistair Boettiger published_in:Science}

  \item{page}{number pages to return (optional)}

  \item{numItems}{number of hits to return (optional)}

  \item{key}{Mendeley API key (otherwise will try and load
  from package)}

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
\details{
  see
  \url{http://apidocs.mendeley.com/home/public-resources/search-terms}
}
\examples{
\dontrun{
 a = msearch("bob", , 20)
 b = msearch("bob", 4, 20)
 d = msearch("authors:Alistair Boettiger published_in:Science")
 # Get the DOIs of Journal of Ecology hits (returns first 999 exact matches)
  all <- msearch("published_in:\\"Journal of Ecology\\"")
  dois <- sapply(all, function(x) x$doi)
}
}

