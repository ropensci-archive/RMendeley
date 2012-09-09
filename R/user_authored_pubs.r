#'authoredPubs - allows authenticated users to retrieve their own publications.
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' authoredPubs(mc)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
authoredPubs <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    au_pubs <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/documents/authored/",
        , "GET")
    au_pubs <- fromJSON(au_pubs)
    return(au_pubs)
}
