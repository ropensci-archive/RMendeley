#'Function to obtain OAuth tokens from Mendeley to faciliate user specific methods.
#'
#' User specific API methods require obtaining access keys from Mendeley.com. To do so, first sign up at the Mendeley \href{http://apidocs.mendeley.com/}{developer site} and obtain Mendeley API keys. Ideally you should store these keys in your \code{.rprofile} like so:
#' \code{options(MendeleyKey="Your_Key")}
#' \code{options(MendeleySecret="Your_secret_key")}
#' If this is not possible (assuming you are on a public machine), then you can spefify both inline. Calling \code{mendeley_auth()} with the right keys will launch your default browser and take you to Mendeley.com to authorize this application. If you are not logged in, you will first be prompted to login with your Mendeley user/pass. Next, click accept to see a pin. At that point, copy the pin and paste it back at the R prompt. If you assign this to a R object, then you can use that as the first argument in all functions that require authentication.
#' If you have successfully completed this step, you should ideally save the \code{Oauth credential object} to disk for future use. There is no need to repeat this step each time.
#'@param cKey Consumer key. can be supplied here or read from Options()
#'@param  cSecret Consumer secret. can be supplied here or read from Options()
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#'@param ... optional additional curl options (debugging tools mostly).
#'@keywords authentication
#'@return OAUth credential.
#'@export mendeley_auth
#'@examples \dontrun{
#' mc <- mendeley_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
#' mc <- mendeley_auth() # If your keys are stored in options using
#' as MendeleyKey and MendeleyPrivateKey.
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
mendeley_auth <- function(cKey = getOption("MendeleyKey", stop("Missing Mendeley consumer key")),
    cSecret = getOption("MendeleyPrivateKey", stop("Missing Mendeley app secret")),
    curl = getCurlHandle(), ...) {
    reqURL <- "http://api.mendeley.com/oauth/request_token/"
    accessURL <- "http://api.mendeley.com/oauth/access_token/"
    authURL <- "http://api.mendeley.com/oauth/authorize/"
    mendeley_oa <- oauth(cKey, cSecret, reqURL, authURL, accessURL, obj = new("MendeleyCredentials"))
    cred <- handshake(mendeley_oa, post = FALSE, verify = ("Paste the PIN from the Mendeley website here: "))
    if (TRUE) {
        cat("\n Mendeley authentication was successful \n")
        return(cred)
    }
}
