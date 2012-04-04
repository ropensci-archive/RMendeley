#' contacts- List Mendeley contacts
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#' @param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@return list
#'@export
#'@examples \dontrun{
#' user_contacts(mendeley_cred)
#'}
contacts <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    mendeley_contacts <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/profiles/contacts/",
        , "GET")
    mendeley_contacts <- ldply(fromJSON(mendeley_contacts))
    mendeley_contacts <- arrange(mendeley_contacts, name)
    return(mendeley_contacts)
}
