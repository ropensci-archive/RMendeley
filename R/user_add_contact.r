# testing to see if the push to the dev branch works file.
# Having issues with POST in the new OAUTh
#' Add another Mendeley user as a contact with their Mendeley ID.
#'@param mendeley_cred Your Mendeley OAuth credentials.
#'@param  mendeley_user_id Mendeley user id of your contact.
#'@keywords
#'@seealso user_contacts
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_add_contacts <- function(mendeley_cred, mendeley_user_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(mendeley_user_id)) {
		stop ("You did not specifiy the ID for your contact", call.= FALSE)
	}	
add_url <- paste("http://api.mendeley.com/oapi/profiles/contacts/",mendeley_user_id,"/",sep="")
	add <- mendeley_cred$OAuthRequest(add_url,  ,"POST")
return (add)
}
# API DOC: http://apidocs.mendeley.com/home/user-specific-methods/user-profile-add-contact

# Has verification errors like like user_create_folder()

# testing
# add_url <- "http://api.mendeley.com/oapi/profiles/contacts/5089461/"
# mendeley_cred$OAuthRequest(add_url, , "POST")