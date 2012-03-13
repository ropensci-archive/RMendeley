#'The following methods will essentially delete a group from the user's library. 
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@param  group_id = NULL <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_delete_group <- function(mendeley_cred, group_id = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
# function specific stuff
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group