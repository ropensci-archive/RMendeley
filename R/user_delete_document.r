#'Allows authenticated users to remove a folder from their library. 
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@param  folder_id Id of the folder which contains the document to be removed.
#'@param  doc_id Id of the document to be removed.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_delete_documents  <- function(mendeley_cred, folder_id = NULL, doc_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
if(is.null(folder_id) | is.null(doc_id)) {
	stop("Missing folder and/or document id", call. = FALSE)
	}	
del_url <- paste("", folder_id, "/", doc_id, "/", sep="")
delete_folder <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/folders/
",  , "DELETE")
return (delete_folder)
}	
# API: http://apidocs.mendeley.com/user-library-delete-document-from-folder