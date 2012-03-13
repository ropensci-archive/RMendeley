#' Retuns a list of your Mendeley folders with sizes
#'@param mendeley_cred Your Mendeley ROAuth credential.
#'@keywords
#'@seealso
#'@return list
#'@alias
#'@export
#'@examples \dontrun{
#' user_folders(mendeley_cred)
#'}
user_folders <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	mendeley_folders <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/folders/", , "GET")
	mendeley_folders <- fromJSON(mendeley_folders)
	return(mendeley_folders)
}