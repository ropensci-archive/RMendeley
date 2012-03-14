
#'This function will create a new group in the user's library. 
#'@param mendeley_cred Your Mendeley OAuth credentials.
#'@param  group Name of your group.
#'@param  type Three types of groups are allowed: 'private', 'invite' and 'open'.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@import RJSONIO
#'@export
#'@examples \dontrun{
#'
#'}
user_create_group <- function(mendeley_cred, group_name = NULL, type = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
if(is.null(group_name)) {
	stop("You did not specify a group name", call.= FALSE)
}
group <- list()
group$name <- group_name
group$type <- "invite" # private or open are other options
group <- toJSON(group)

}
# API:  http://api.mendeley.com/oapi/library/groups/