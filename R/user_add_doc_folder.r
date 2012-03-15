# Second test of pushing to dev -> not master.
#'Allows authenticated users to add a document to an specific folder. The document must exists on the library 
#'@param mendeley_cred <what param does>
#'@param  folder_id <what param does>
#'@param  doc_id <what param does>
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
user_add_doc_folder <- function(mendeley_cred, folder_id = NULL, doc_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}
	#function specifics.
}	
# API: http://apidocs.mendeley.com/user-library-add-document-to-folder