#'deleteDocument - delete a document from your library.
#'
#'Deletes from library if no folder is specified. Deletes from folder if a folder id is specified.
#'@param mc OAuth object of class MendeleyCredentials
#'@param  folder_id Id of the folder which contains the document to be removed.
#'@param  doc_id Id of the document to be removed.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' deleteDocument(...)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
deleteDocument <- function(mc = NULL, doc_id = NULL, folder_id = NULL,
    ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
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
    deleted_doc <- OAuthRequest(mc, u, method = "DELETE", ..., curl = curl,
        followlocation = TRUE)
    if (deleted_doc == "") {
        cat("successfully deleted document", doc_id, "from folder ", folder_id, "\n")
    } else {
        return(fromJSON(deleted_doc))
    }
}
# API: http://apidocs.mendeley.com/user-library-delete-document-from-folder
