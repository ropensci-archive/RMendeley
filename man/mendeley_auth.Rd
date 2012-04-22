\name{mendeley_auth}
\alias{mendeley_auth}
\title{Function to obtain OAuth tokens from Mendeley to faciliate user specific methods.}
\usage{
  mendeley_auth(cKey = getOption("MendeleyKey", stop("Missing Mendeley consumer key")),
    cSecret = getOption("MendeleyPrivateKey", stop("Missing Mendeley app secret")),
    curl = getCurlHandle(), ...)
}
\arguments{
  \item{cKey}{Consumer key. can be supplied here or read
  from Options()}

  \item{cSecret}{Consumer secret. can be supplied here or
  read from Options()}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{...}{optional additional curl options (debugging
  tools mostly).}
}
\value{
  OAUth credential.
}
\description{
  User specific API methods require obtaining access keys
  from Mendeley.com. To do so, first sign up at the
  Mendeley \href{http://apidocs.mendeley.com/}{developer
  site} and obtain Mendeley API keys. Ideally you should
  store these keys in your \code{.rprofile} like so:
  \code{options(MendeleyKey="Your_Key")}
  \code{options(MendeleySecret="Your_secret_key")} If this
  is not possible (assuming you are on a public machine),
  then you can spefify both inline. Calling
  \code{mendeley_auth()} with the right keys will launch
  your default browser and take you to Mendeley.com to
  authorize this application. If you are not logged in, you
  will first be prompted to login with your Mendeley
  user/pass. Next, click accept to see a pin. At that
  point, copy the pin and paste it back at the R prompt. If
  you assign this to a R object, then you can use that as
  the first argument in all functions that require
  authentication. If you have successfully completed this
  step, you should ideally save the \code{Oauth credential
  object} to disk for future use. There is no need to
  repeat this step each time.
}
\examples{
\dontrun{
mc <- mendeley_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
mc <- mendeley_auth() # If your keys are stored in options using
as MendeleyKey and MendeleyPrivateKey.
}
}
\keyword{authentication}

