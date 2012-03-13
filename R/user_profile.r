#'Returns profile of a Mendeley user
#'
#'@param mendeley_cred Mendeley OAUth credentials.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export mendeley_autH
#'@examples \dontrun{
#' user_profile(mendeley_cred, '39369') # If left blank, it will retrieve your profile.
#'}
user_profile <- function(mendeley_cred, mendeley_user_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
base_url <- "http://api.mendeley.com/oapi/profiles/info/"
profile_url <- ifelse(is.null(mendeley_user_id),paste(base_url,"me",sep=""),paste(base_url,mendeley_user_id,sep=""))
	user_profile_info <- mendeley_cred$OAuthRequest(profile_url, , "GET")
	user_profile_info <- fromJSON(user_profile_info)
	return(user_profile_info)
}