#'docInfo - returns citation info for a specific paper
#'
#' returns citation info for a specific paper, such as authors, user tags, publication outlet, year, abstract, PubMed ID if available, etc.
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  id Document id (retrieved with /oapi/library/)
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@examples \dontrun{
#' user_doc_details(mendeley_cred, '4388654895')
#'}
docInfo <- function(mendeley_cred = NULL, id = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(id)) {
        stop("Missing document id number", call. = FALSE)
    }
    user_doc_url <- paste("http://api.mendeley.com/oapi/library/documents/", id,
        "/", sep = "")
    user_doc_det <- OAuthRequest(mendeley_cred, user_doc_url, , "GET")
    user_doc_det <- fromJSON(user_doc_det)
    return(user_doc_det)
}
# ------------------------------------------------------------------------------------------------
getDocInfo <- function(mendeley_cred = NULL, doc, ..., curl = getCurlHandle()) {
    if (length(doc) > 1)
        return(lapply(doc, function(d) getDocInfo(cred, doc, ..., curl = curl)))
    u <- as(doc, "URL")
    ans <- OAuthRequest(mendeley_cred, u, ..., curl = curl)
    fromJSON(ans)
}
