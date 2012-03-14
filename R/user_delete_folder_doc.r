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
user_delete_folder_doc <- function(mendeley_cred, folder_id = NULL, doc_id = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
if(is.null(folder_id)) {
	stop("Group id is missing", call. = FALSE)
 }
del_folder_doc <- paste("http://api.mendeley.com/oapi/library/folders/", folder_id, "/", doc_id, "/", sep="")
delete_folder_doc <- mendeley_cred$OAuthRequest(del_folder_doc,  , "DELETE")
return (delete_folder_doc)
}