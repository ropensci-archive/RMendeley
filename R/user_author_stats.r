#' authorStats - Returns list of top 5 authors in your library.
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@return List
#'@export
#'@examples \dontrun{
#' authorStats(mendeley_oauth_cred)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
authorStats <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    au_stats <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/authors/",
        , "GET")
    au_stats <- fromJSON(au_stats)
    return(ldply(au_stats))
}
