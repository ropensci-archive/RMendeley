#'Returns citation info for a specific paper, such as authors, user tags, publication outlet, year, abstract, PubMed ID if available, etc.
#'@param mendeley_cred <what param does>
#'@param  id Document id (retrieved with /oapi/library/)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_doc_details(mendeley_cred, '4388654895')
#'}
user_doc_details  <- function(mendeley_cred, id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(id)) {
		stop("Missing document id number", call.= FALSE)
	}
user_doc_url <- paste("http://api.mendeley.com/oapi/library/documents/", id, "/", sep ="")
	user_doc_det <- mendeley_cred$OAuthRequest(user_doc_url, , "GET")
	user_doc_det <- fromJSON(user_doc_det)
	return(user_doc_det)
}	
