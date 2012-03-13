#'Returns list of top 5 authors in user library.
#'
#'@param mendeley_cred Your Mendeley OAuth Keys
#'@keywords
#'@seealso
#'@return List
#'@alias
#'@export
#'@examples \dontrun{
#' author_stats(mendeley_oauth_cred)
#'}
user_author_stats <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	au_stats <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/authors/", , "GET")
	au_stats <- fromJSON(au_stats)
	return(ldply(au_stats))
}