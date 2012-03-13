#'Function to create a folder in your Mendeley library
#'@param mendeley_cred Your Mendeley OAUth credentials
#'@param  folder Name of your new folder
#'@keywords
#'@seealso
#'@return JSON object containing your folder ID if successful.
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_create_folder <- function(mendeley_cred, folder = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(folder)) {
		stop("You did not specify a name for your new folder", call.= FALSE)
	}
folder_name <- list()
folder_name$name <- folder	
folder_name <- toJSON(folder_name)	
add_folder <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/folders/folder
", folder_name , "POST")
return (add_folder)
}
# Verification of signature errors. 