\name{public_groups_documents}
\alias{public_groups_documents}
\title{public_groups_documents.R   Public Group Methods (Public Methods)}
\usage{
  public_groups_documents(query, details = FALSE,
    page = NA, numItems = 1000L,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s/\%s", "http://api.mendeley.com/oapi/documents/groups", query, "docs/?details=true"),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{a public group ID number}

  \item{details}{if detailed information
  (public_group_details) should be returned; logical,
  default is FALSE}

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
  detailed metadata for all articles in the public group
}
\description{
  Returns list of documents ids within a public group. It
  is possible
}
\details{
  to retrieve documents details in the same request setting
  the optional parameter details to true.
}
\examples{
\dontrun{
public_groups_details(492511)
}
}

