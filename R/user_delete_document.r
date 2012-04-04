#'deleteDocument - allows authenticated users to remove a document from their library.
#'
#'Deletes from library if no folder is specified. Deletes from folder if a folder id is specified.
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  folder_id Id of the folder which contains the document to be removed.
#'@param  doc_id Id of the document to be removed.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' deleteDocument(...)
#'}
deleteDocument <- function(mendeley_cred = NULL, doc_id = NULL, folder_id = NULL,
    ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(doc_id)) {
        stop("No document ID", call. = FALSE)
    }
    if (is.null(folder_id)) {
        u <- sprintf("http://api.mendeley.com/oapi/library/documents/%s/", doc_id)

    } else {
        u <- sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/", folder_id,
            doc_id)
    }
    deleted_doc <- OAuthRequest(mendeley_cred, u, method = "DELETE", ..., curl = curl,
        followlocation = TRUE)
    if (deleted_doc == "") {
        cat("successfully deleted document", doc_id, "from folder ", folder_id, "\n")
    } else {
        return(fromJSON(deleted_doc))
    }
}
# API: http://apidocs.mendeley.com/user-library-delete-document-from-folder
