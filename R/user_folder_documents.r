#'folderDocs - allows authenticated users to retrieve documents within a folder.
#'
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  folder_id ...
#'@param  page ...
#'@param  items ...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_folder_documents(mendeley_cred, '22468211')
#'}
folderDocs <- function(mendeley_cred = NULL, folder_id = NULL, page = NULL,
    items = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(folder_id)) {
        stop("You did not enter a folder ID.", call. = FALSE)
    }
    folder_doc_url <- sprintf("http://api.mendeley.com/oapi/library/folders/%s/", folder_id)
    group_docs <- OAuthRequest(mendeley_cred, folder_doc_url, , "GET")
    group_docs <- fromJSON(group_docs)
    lapply(group_docs$document_ids,
           function(x)
              new("MendeleyDocumentID", x, folder = new("MendeleyFolderID", group_docs$folder_id)))
    return(group_docs)
}
