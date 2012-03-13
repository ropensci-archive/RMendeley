
user_delete_doc_folder  <- function(mendeley_cred)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
}	
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-remove-document