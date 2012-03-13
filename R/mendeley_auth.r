#'Function to obtain OAuth tokens from Mendeley to faciliate user specific methods.
#'
#'<longer description>
#'@param cKey Consumer key. can be supplied here or read from Options()
#'@param  cSecret Consumer secret. can be supplied here or read from Options()
#'@keywords
#'@seealso
#'@return OAUth credential.
#'@alias
#'@export
#'@examples \dontrun{
#' mendeley_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
#' mendeley_auth() # If your keys are stored in options using
#' as MendeleyKey and MendeleyPrivateKey.
#'}
mendeley_auth <- function(cKey = NULL, cSecret=NULL) {
    if (is.null(cKey) && is.null(cSecret)) {
        cKey = getOption("MendeleyKey")
        cSecret = getOption("MendeleyPrivateKey")
        if (length(cKey) == 0 | length(cSecret) == 0) {
            stop("Could not find your Mendeley keys in the function arguments or in your options. ?rMendeley for more help")
        }
    }
 mendeley_cred <- OAuthFactory$new(consumerKey = cKey, consumerSecret = cSecret,
requestURL = reqURL,accessURL = accessURL,
authURL = authURL)
mendeley_cred$handshake(post = FALSE, verbose = FALSE)   

cat("We recommend that you save mendeley_cred to disk using the save command. Doing so will allow you to reload your credentials from disk and skip the auth step every time")
}
# Notes: requires new ROAuth (ROAuth_0.91.0) which is not yet on CRAN. 