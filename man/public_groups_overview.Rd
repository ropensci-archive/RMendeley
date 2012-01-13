\name{public_groups_overview}
\alias{public_groups_overview}
\title{public_groups_overview.R   Public Group Methods (Public Methods)}
\usage{
  public_groups_overview(page = NA, numItems = 1000L,
    cat = NA,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = "http://api.mendeley.com/oapi/documents/groups",
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{page}{number pages to return (optional)}

  \item{numItems}{number of hits to return (optional)}

  \item{cat}{Only tags appearing in this subject category
  See the search-categories function to obtain a list of
  the numeric codes corresponding to each of the main
  subject categories.}

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
  detailed metadata for all articles in the public group
}
\description{
  This method will return a list of public groups available
  on Mendeley sorted by number of members.
}
\examples{
\dontrun{
 public_groups_overview()
}
}

