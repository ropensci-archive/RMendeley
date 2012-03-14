# does not work.

#'Creates a new document in the user's library or a group. 
#'
#'<longer description>
#'@param mendeley_cred <what param does>
#'@param  group_id = NULL <what param does>
#'@param  type = NULL <what param does>
#'@param  title = NULL <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_create_documents  <- function(mendeley_cred, group_id = NULL, type = NULL, title = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}

document <- list()
document$type <- "Book"
document$title <- "My book"
document <- toJSON(document)
	doc_created <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/documents/", list(document = document), "POST")
	doc_created <- fromJSON(doc_created)
	return(doc_created)
}	
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-create-document