\name{addContact}
\alias{addContact}
\title{addContact - Add a contact on Mendeley}
\usage{
  addContact(mc = NULL, mendeley_user_id = NULL, ...,
    curl = getCurlHandle())
}
\arguments{
  \item{mc}{OAuth object of class MendeleyCredentials}

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
addContact(mc, '12356')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}
\seealso{
  user_contacts
}

