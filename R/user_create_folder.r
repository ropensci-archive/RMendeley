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
user_create_folder <- function(mendeley_cred, folder_name = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(folder_name)) {
		stop("You did not specify a name for your new folder", call.= FALSE)
	}
folder <- list()
folder$name <- folder_name	
folder <- toJSON(folder)	
add_folder <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/folders/folder",
                                         list(folder_name = folder) , "POST")
return (add_folder)
}
# API: http://apidocs.mendeley.com/user-library-create-folder
# Verification of signature errors. 
# A link to discussion on the verificatione errors:
# https://groups.google.com/forum/?fromgroups#!topic/mendeley-open-api-developers/ncau3VlOrYw
