#'Allows authenticated users to retrieve documents within a folder.
#'@param mendeley_cred 
#'@param  folder_id  
#'@param  page 
#'@param  items  
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_folder_documents(mendeley_cred, '22468211')
#'}
user_folder_documents <- function(mendeley_cred, folder_id = NULL, page = NULL, items = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}

if(is.null(folder_id)) {
	stop("You did not enter a group ID.", call.= FALSE)
}
    folder_doc_url <- paste("http://api.mendeley.com/oapi/library/folders/", folder_id,"/", sep = "")
	group_docs <- mendeley_cred$OAuthRequest(folder_doc_url, , "GET")
	group_docs <- fromJSON(group_docs)
	return(group_docs)
}