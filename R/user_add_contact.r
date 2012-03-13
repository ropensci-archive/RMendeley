# Having issues with POST in the new OAUTh

user_add_contacts <- function(mendeley_cred, mendeley_user_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	if(is.null(mendeley_user_id)) {
		stop ("You did not specifiy the ID for your contact", call.= FALSE)
	}	
add_url <- paste("http://api.mendeley.com/oapi/profiles/contacts/",mendeley_user_id,"/",sep="")
	add <- mendeley_cred$OAuthRequest(add_url, , "POST")
return (add)
# function specific stuff
}

# testing

# add_url <- "http://api.mendeley.com/oapi/profiles/contacts/5089461/"
# mendeley_cred$OAuthRequest(add_url, , "POST")