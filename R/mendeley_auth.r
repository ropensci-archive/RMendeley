

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

cat("We recommend that you save mendeley_cred to disk using the save command. Doing so will and reloading your credentials from disk will allow you to skip the auth step every time")
}


# Notes: requires new ROAuth which is not yet on CRAN.