#'Allows authenticated users to get the most recent tags used in their library
#'@param mendeley_cred <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_tag_stats(mendeley_cred)
#'}
user_tag_stats <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
	tag_stats <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/tags/", , "GET")
	tag_stats <- fromJSON(tag_stats)
	return(ldply(tag_stats))
}