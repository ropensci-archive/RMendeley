#'Returns list of top 20 publication outlets in library.
#'@param mendeley_cred <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_pub_stats <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
	pub_stats <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/publications/", , "GET")
	pub_stats <- fromJSON(pub_stats)
	return(ldply(pub_stats))
}