\name{authors}
\alias{authors}
\title{authors Stats Method (Public Method)}
\usage{
  authors(discipline = NULL, upandcoming = FALSE,
    url = "http://api.mendeley.com/oapi/stats/authors/",
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
  Returns list of top authors of given disipline or overall
}
\examples{
\dontrun{
  authors()
  authors(discipline="6") # Discipline "6", Computer Science
}
}
\keyword{method}
\keyword{public}
\keyword{stats}

