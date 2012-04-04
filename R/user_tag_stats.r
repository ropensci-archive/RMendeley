#'tagStats - allows authenticated users to get the most recent tags used in their library
#'
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@return list with tags
#'@examples \dontrun{
#' user_tag_stats(mendeley_cred)
#'}
tagStats <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    tag_stats <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/tags/",
        , "GET")
    tag_stats <- fromJSON(tag_stats)
}
