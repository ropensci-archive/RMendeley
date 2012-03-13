#'Allows authenticated users to retrieve all the documents in their library.
#'@param mendeley_cred Your Mendeley ROauth credentials.
#'@param  page  Page number of search results
#'@param  items  Number of items per page
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_library(mendeley_cred)
#' user_library(mendeley_cred, 2)
#' user_library(mendeley_cred, 1, 25)
#'}
user_library <- function(mendeley_cred, page = NULL, items = NULL)
{
	lib_url <- ""
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are missing or incorrect. Please run mendeley_auth() again")
	}
	lib_opts <- list()
	if(!is.null(page)) {
		lib_opts$page  <- page
	}

	if(!is.null(items)) {
		lib_opts$items <-  items
	}

	library <- mendeley_cred$OAuthRequest("http://api.mendeley.com/oapi/library/", lib_opts, "GET")
	library <- fromJSON(library)
	return(library)
}	 