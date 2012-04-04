#'pubStats - returns list of top 20 publication outlets in library.
#'
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_pub_stats(...)
#'}
pubStats <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    pub_stats <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/publications/",
        , "GET")
    pub_stats <- fromJSON(pub_stats)
    return(ldply(pub_stats))
}
