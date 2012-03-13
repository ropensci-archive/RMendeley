#' Returns list of group members and their Mendeley usr IDs
#'@param mendeley_cred Your Mendeley OAuth credential.
#'@param  group_id ID of group
#'@keywords
#'@seealso user_groups
#'@return list
#'@alias
#'@export
#'@examples \dontrun{
#' user_group_people(mendeley_cred, '530031')
#'}
user_group_people <- function(mendeley_cred, group_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
	if(is.null(group_id)) {
		stop("You did not specifiy a group ID", call. = FALSE)
	}
	group_url <- paste("http://api.mendeley.com/oapi/library/groups/", group_id, "/people/", sep="")
	groups_people <- mendeley_cred$OAuthRequest(group_url, , "GET")
	groups_people <- fromJSON(groups_people)
	format_groups <- function(group_peeps){
		x1 <- ldply(group_peeps[[1]])
		names(x1) <- c('user_id', 'name')
		x1 <- x1[-1, ]
		x1$status <- "owner"
		x2 <- ldply(group_peeps[[2]])
		if(dim(x2)[2]>0) {
		x2$status <- "admin"
		}
		x3 <- ldply(group_peeps[[3]])
		if(dim(x3)[2]>0) {
		x3$status <- 'followers'
		}
		x4 <- ldply(group_peeps[[4]])
		x4$status <- "members"
		return(rbind(x1,x2,x3,x4))
	}
	return(format_groups(groups_people))
}
# Errors: 
# Warning message:
# In RCurlIconv(str, from = "C99", to = encoding) :
#   C99 not supported iconv entries
# Calls: user_group_people ... getURLContent -> <Anonymous> -> encode -> RCurlIconv
# http://api.mendeley.com/oapi/library/groups/<group_id>/people/
# http://api.mendeley.com/oapi/library/groups/1377653/people/
#  1377653
# http://api.mendeley.com/oapi/library/groups/564031/people/
	 