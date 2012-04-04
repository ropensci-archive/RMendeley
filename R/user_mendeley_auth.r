#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleyCredentials", contains = "OAuthCredentials")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyID-class
#' @rdname MendeleyID-class
#' @exportClass MendeleyID
setClass("MendeleyID", contains = "character")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyGroupID-class
#' @rdname MendeleyGroupID-class
#' @exportClass MendeleyGroupID
setClass("MendeleyGroupID", contains = "MendeleyID")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyFolderID-class
#' @rdname MendeleyFolderID-class
#' @exportClass MendeleyFolderID
setClass("MendeleyFolderID", contains = "MendeleyID")
# This documentID has no folder.
#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleySimpleDocumentID", contains = "MendeleyID")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleyDocumentID", representation(folder = "MendeleyFolderID"),
    contains = "MendeleyID")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("URL", contains = "character")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyDocumentID-class
#' @rdname MendeleyDocumentID-class
#' @exportClass MendeleyDocumentID
setAs("MendeleyDocumentID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/",
    from@folder, as(from, "character")))
#' An S4 class that stores Mendeley credentials
#' @name MendeleySimpleDocumentID-class
#' @rdname MendeleySimpleDocumentID-class
#' @exportClass MendeleySimpleDocumentID
setAs("MendeleySimpleDocumentID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/documents/%s/",
    as(from, "character")))
#' An S4 class that stores Mendeley credentials
#' @name MendeleyFolderID-class
#' @rdname MendeleyFolderID-class
#' @exportClass MendeleyFolderID
setAs("MendeleyFolderID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/folders/%s/",
    as(from, "character")))
#' An S4 class that stores Mendeley credentials
#' @name MendeleyGroupID-class
#' @rdname MendeleyGroupID-class
#' @exportClass MendeleyGroupID
setAs("MendeleyGroupID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/groups/%s/",
    as(from, "character")))

#'Function to obtain OAuth tokens from Mendeley to faciliate user specific methods.
#'
#' User specific API methods require obtaining access keys from Mendeley.com. To do so, first sign up at the Mendeley developer site \url{} and obtain Mendeley API keys. Ideally you should store these keys in your \code{.rprofile} like so:
#' options(MendeleyKey="Your Key")
#' options(MendeleySecret="Your secret key")
#' If this is not possible (assuming you are on a public machine), then you can spefify both inline. Calling \code{mendeley_auth()} with the right keys will launch your default browser and take you to Mendeley.com to authorize this application. If you are not logged in, you will first be prompted to login with your Mendeley user/pass. Next, click accept to see a pin. At that point, copy the pin and paste it back at the R prompt. If you assign this to a R object, then you can use that as the first argument in all functions that require authentication.
#'
#' if you have successfully completed this step, you should ideally save the \code{Oauth credential object} to disk for future use. There is no need to repeat this step each time.
#'@param cKey Consumer key. can be supplied here or read from Options()
#'@param  cSecret Consumer secret. can be supplied here or read from Options()
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@keywords authentication
#'@return OAUth credential.
#'@export
#'@examples \dontrun{
#' mendeley_cred <- mendeley_auth('YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET')
#' mendeley_cred <- mendeley_auth() # If your keys are stored in options using
#' as MendeleyKey and MendeleyPrivateKey.
#'}
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
