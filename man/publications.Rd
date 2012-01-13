\name{publications}
\alias{publications}
\title{publications.R: A Stats Method (Public Methods)}
\usage{
  publications(discipline = NULL, upandcoming = FALSE,
    url = "http://api.mendeley.com/oapi/stats/publications/",
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{discipline}{a numeric code indicating the
  discipline}

  \item{upandcoming}{logical: give recent/trending top
  authors only?}

  \item{url}{Mendeley API URL (don't change this)}

  \item{key}{Mendeley API key (otherwise will try and load
  from package)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}
}
\description{
  publications.R: A Stats Method (Public Methods)
}
\examples{
\dontrun{
publications()
publications("6", up=T, verbose=T)
}
}

