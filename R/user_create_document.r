#'createDocument - Creates a new document in the user's library or a group. [not working]
#'
#'<longer description>
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param doc ...
#'@param  type type of group. Can be public, private or invite.
#'@param  title title of group document.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_create_document(mendeley_cred, ....)
#'}
createDoc <- function(mendeley_cred = NULL, doc, type = "Thesis",
    title = "title", ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    jdoc <- toJSON(doc, type = type, title = title, collapse = "")
    val <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/documents/",
        list(document = jdoc), "POST", curl = curl)
    new("MendeleySimpleDocumentID", as.character(fromJSON(val)))
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-create-document
