
#'Allows authenticated users to retrieve their own publications.
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_authored_pubs(mendeley_cred)
#'}
user_authored_pubs  <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	au_pubs <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/documents/authored/", , "GET")
	au_pubs <- fromJSON(au_pubs)
	return(au_pubs)
}	
