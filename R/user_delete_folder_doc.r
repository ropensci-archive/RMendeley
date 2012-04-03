#' Allows authenticated users to remove a folder from their library. Documents contained in the folder won't be removed and will still be available in the user's library.
#'@param mendeley_cred Your Mendeley OAuth credential.
#'@param  folder_id  Id of the folder which contains the document to be removed.
#'@param  doc_id Id of the document to be removed.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_delete_folder_doc <- function(mendeley_cred, folder_id = NULL, doc_id = NULL,..., curl=getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") ||  missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.", call.= FALSE)

  if(!is.null(folder)) {
     u = sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/", folder_id, doc_id)
  } else
     u =  as(doc, "URL")
 deleted_doc <- OAuthRequest(mendeley_cred, u, method = "DELETE", ..., curl = curl, followlocation = TRUE)
if(deleted_doc=="") {
	cat("successfully deleted document", doc_id, "from folder ", folder_id, "\n")
			} else {
				return(fromJSON(deleted_doc))
			}
}

