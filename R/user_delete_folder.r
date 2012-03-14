#'Allows authenticated users to remove a folder from their library. Documents contained in the id.
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@param  id Id of the folder to be removed.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_delete_folder <- function(mendeley_cred, id = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
if(is.null(id)) {
	stop("Missing folder id", call. = FALSE)
	}	
del_folder_url <- paste("http://api.mendeley.com/oapi/library/folders/", id, "/", sep="")
delete_folder <- mendeley_cred$OAuthRequest(del_folder_url,  , "DELETE")
return (delete_folder)
}
# API: http://apidocs.mendeley.com/user-library-delete-folder