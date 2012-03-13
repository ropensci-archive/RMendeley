#'Gives you a list of Mendeley groups
#'@param mendeley_cred Your Mendeley OAUth credentials.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' mendeley_groups(mendeley_cred)
#'}
user_groups <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
	mendeley_groups <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/groups/", , "GET")
	mendeley_groups <- fromJSON(mendeley_groups)
   return(mendeley_groups)
}