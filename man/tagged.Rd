\name{tagged}
\alias{tagged}
\title{tagged.R   Search Method (Public Method)}
\usage{
  tagged(query, page = NA, numItems = 1000L, cat = NA,
    subcat = NA,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/documents/tagged", query),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{any possible tag in Mendeley}

  \item{page}{number pages to return (optional)}

  \item{cat}{Only tags appearing in this subject category
  See the search-categories function to obtain a list of
  the numeric codes corresponding to each of the main
  subject categories.}

  \item{subcat}{a subcategory to restrict searching to}

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
  all results matching the query
}
\description{
  tagged.R Search Method (Public Method)
}
\examples{
\dontrun{
a <- tagged("phylogenetics")
b <- tagged("phylogenetics", cat=3)  # biological sciences
}
}

