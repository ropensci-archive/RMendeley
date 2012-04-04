#' groupDocs - returns a list of group documents.
#'
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  group_id Private group ID
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_group_documents(mendeley_cred, group_id='1377483')
#'}
groupDocs <- function(mendeley_cred = NULL, group_id = NULL, ...,
    curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group_id)) {
        stop("You did not enter a group ID.", call. = FALSE)
    }
    group_doc_url <- paste("http://api.mendeley.com/oapi/library/groups/", group_id,
        "/", sep = "")
    group_docs <- OAuthRequest(mendeley_cred, group_doc_url, , "GET")
    group_docs <- fromJSON(group_docs)
    return(group_docs)
}
# test group id =564031
