#' Returns a list of group documents.
#'@param mendeley_cred Your Mendeley OAuth credentials.
#'@param  group_id Private group ID 
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_group_documents(mendeley_cred, group_id='1377483')
#'}
user_group_documents <- function(mendeley_cred, group_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}

if(is.null(group_id)) {
	stop("You did not enter a group ID.", call.= FALSE)
}
    group_doc_url <- paste("http://api.mendeley.com/oapi/library/groups/", group_id,"/", sep = "")
	group_docs <- mendeley_cred$OAuthRequest(group_doc_url, , "GET")
	group_docs <- fromJSON(group_docs)
	return(group_docs)
}
# test group id =564031