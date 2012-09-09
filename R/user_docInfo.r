#'docInfo - returns citation info for a specific paper
#'
#' returns citation info for a specific paper, such as authors, user tags, publication outlet, year, abstract, PubMed ID if available, etc.
#'@param mc OAuth object of class MendeleyCredentials
#'@param  id Document id (retrieved with /oapi/library/)
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@examples \dontrun{
#' docInfo(mc, '4388654895')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
docInfo <- function(mc = NULL, id = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(id)) {
        stop("Missing document id number", call. = FALSE)
    }
    user_doc_url <- paste("http://api.mendeley.com/oapi/library/documents/", id,
        "/", sep = "")
    user_doc_det <- OAuthRequest(mc, user_doc_url, , "GET")
    user_doc_det <- fromJSON(user_doc_det)
    return(user_doc_det)
}
