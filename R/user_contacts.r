#' contacts - List  of  current Mendeley contacts
#'@param mc OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@return list
#'@export
#'@examples \dontrun{
#' contacts(mc)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
contacts <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

    name <- "NA"
    mendeley_contacts <- OAuthRequest(mc, "http://api.mendeley.com/oapi/profiles/contacts/",
        , "GET")
    mendeley_contacts <- ldply(fromJSON(mendeley_contacts))
    mendeley_contacts <- arrange(mendeley_contacts, name)
    return(mendeley_contacts)
}
