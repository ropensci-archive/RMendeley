\name{public_groups_people}
\alias{public_groups_people}
\title{public_groups.people.R   Public Group Methods (Public Methods)}
\usage{
  public_groups_people(query,
    key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = sprintf("\%s/\%s/\%s", "http://api.mendeley.com/oapi/documents/groups", query, "people"),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{query}{a public group ID number}

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
  This method will return further people about a group.
}
\examples{
\dontrun{
public_groups_people(492511)
}
}

