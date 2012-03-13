#' Returns list of group members and their Mendeley usr IDs
#'@param mendeley_cred Your Mendeley OAuth credential.
#'@param  group_id ID of group
#'@keywords
#'@seealso user_groups
#'@return list
#'@alias
#'@export
#'@examples \dontrun{
#' user_group_people(mendeley_cred,'1377653')
#'}
user_group_people <- function(mendeley_cred, group_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(group_id)) {
		stop("You did not specifiy a group ID", call. = FALSE)
	}
	group_url <- paste("http://api.mendeley.com/oapi/library/groups/", group_id, "/people/", sep="")
	groups_people <- mendeley_cred$OAuthRequest(group_url, , "GET")
	groups_people <- fromJSON(groups_people)
	return(groups_people)
}
# http://api.mendeley.com/oapi/library/groups/<group_id>/people/
# http://api.mendeley.com/oapi/library/groups/1377653/people/
#  1377653
# http://api.mendeley.com/oapi/library/groups/564031/people/