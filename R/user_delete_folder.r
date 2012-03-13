#'Allows authenticated users to remove a folder from their library. Documents contained in the id.
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@param  id Id of the folder to be removed.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_delete_folder <- function(mendeley_cred, id = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
}
# API: http://apidocs.mendeley.com/user-library-delete-folder