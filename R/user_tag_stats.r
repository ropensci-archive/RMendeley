
#'tagStats - allows authenticated users to get the most recent tags used in their library
#'
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@return list with tags
#'@examples \dontrun{
#' tagStats(mc)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
tagStats <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    tag_stats <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/tags/",
        , "GET")
    tag_stats <- fromJSON(tag_stats)
    return(tag_stats)
}
