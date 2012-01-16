\name{groups}
\alias{groups}
\title{query for documents in a given group}
\usage{
  groups(query, page = NA, numItems = 10, cat = NA,
    url = "http://api.mendeley.com/oapi/documents/groups/",
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{a group name to query}

  \item{page}{number of pages to return (optional)}

  \item{numItems}{number of hits to return (optional)}

  \item{cat}{see Mendeley documentation}

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
  query for documents in a given group
}

