#'pubStats - returns list of top 20 publication outlets in your library.
#'
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_pub_stats(...)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
pubStats <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    pub_stats <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/publications/",
        , "GET")
    pub_stats <- fromJSON(pub_stats)
    return(ldply(pub_stats))
}
