\name{tags}
\alias{tags}
\title{tags.R a Stats Method (Public Method)}
\usage{
  tags(discipline, upandcoming = FALSE,
    url = sprintf("\%s/\%s", "http://api.mendeley.com/oapi/stats/tags/", discipline),
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{discipline}{a numeric code indicating the
  discipline Discipline id numbers can be displayed by the
  categories() function}

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
  tags.R a Stats Method (Public Method)
}
\examples{
\dontrun{
  tags()
  tags("6")  # Discipline "6", Computer Science
}
}
\keyword{method}
\keyword{public}
\keyword{stats}

