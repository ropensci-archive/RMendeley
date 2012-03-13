#'Function that returns a list of your Mendeley contacts
#'@param mendeley_cred Your Mendeley OAuth credentials.
#'@keywords
#'@seealso
#'@return list
#'@alias
#'@export
#'@examples \dontrun{
#' user_contacts(mendeley_cred)
#'}
user_contacts <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	mendeley_contacts <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/profiles/contacts/", , "GET")
	mendeley_contacts <- fromJSON(mendeley_contacts)
   return(mendeley_contacts)
}