\name{mendeley_profile}
\alias{mendeley_profile}
\title{mendeley_profile - returns profile of a Mendeley user}
\usage{
  mendeley_profile(mendeley_cred = NULL,
    mendeley_user_id = NULL, ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{Mendeley OAUth credentials.}

  \item{mendeley_user_id}{...}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  mendeley_profile - returns profile of a Mendeley user
}
\examples{
\dontrun{
user_profile(mendeley_cred, '39369') # If left blank, it will retrieve your profile.
}
}

