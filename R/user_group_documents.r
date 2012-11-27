#' groupDocs - returns a list of documents in a group.
#'
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group_id Private group ID
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' groupDocs(mc, group_id='530031')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
groupDocs <- function(mc = NULL, group_id = NULL, ...,
    curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group_id)) {
        stop("You did not enter a group ID.", call. = FALSE)
    }
    group_doc_url <- paste("http://api.mendeley.com/oapi/library/groups/", group_id,
        "/", sep = "")
    group_docs <- OAuthRequest(mc, group_doc_url, , "GET")
    group_docs <- fromJSON(group_docs)
    return(group_docs)
}
# test group id =564031
