\name{addContact}
\alias{addContact}
\title{addContact}
\usage{
  addContact(mendeley_cred = NULL, mendeley_user_id = NULL,
    ..., curl = getCurlHandle())
}
\arguments{
  \item{mendeley_cred}{OAuth object of class
  MendeleyCredentials}

  \item{mendeley_user_id}{Mendeley user id of your
  contact.}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\description{
  Add contacts to your Mendeley profile from R. Add another
  Mendeley user as a contact with their Mendeley ID.
}
\examples{
\dontrun{
addContact(mendeley_cred, '12356')
}
}
\seealso{
  user_contacts
}

