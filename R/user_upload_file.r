#'Allows authenticated users to attach files to a document in their library. 
#'@param mendeley_cred Your Mendeley OAuth credentials.
#'@param  id Id of the document we want to attach the file to.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_upload_file  <- function(mendeley_cred, id = NULL) {
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	# function stuff here.
}	
