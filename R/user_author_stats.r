#'Returns list of top 5 authors in user library.
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@return List
#'@export
#'@examples \dontrun{
#' author_stats(mendeley_oauth_cred)
#'}
authorStats <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    au_stats <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/authors/",
        , "GET")
    au_stats <- fromJSON(au_stats)
    return(ldply(au_stats))
}
