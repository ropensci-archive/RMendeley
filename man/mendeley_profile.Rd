\name{mendeley_profile}
\alias{mendeley_profile}
\title{mendeley_profile - Displays your user profile.}
\usage{
  mendeley_profile(mc = NULL, mendeley_user_id = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{Mendeley OAUth credentials.}

  \item{mendeley_user_id}{Mendeley ID of the user you wish
  to look up.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  mendeley_profile - Displays your user profile.
}
\examples{
\dontrun{
mendeley_profile(mc, '39369') # If left blank, it will retrieve your profile.
}
}

