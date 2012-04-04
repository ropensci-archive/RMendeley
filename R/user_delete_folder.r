#' deleteFolder - allows authenticated users to remove a folder from their library. Documents contained in the id.
#'
#'<longer description>
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  name name of folder to be removed
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' deleteFolder(...)
#'}
#DTL  This should take an id that is the human-readable name of the folder and then
 #  call the folders() method to get the actual ID.
 # Allow the caller to use I('id') to specify that it is the actual id.
deleteFolder <- function(mendeley_cred = NULL, name = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    ffname <- name
    name <- getFolderID(mendeley_cred, name, ..., curl = curl)
    u <- sprintf("http://api.mendeley.com/oapi/library/folders/%s/", name)
    result <- mendeley_cred$OAuthRequest(u, method = "DELETE", ..., curl = curl)
    if (result != "") {
        return(fromJSON(result))
    } else {
        cat("Folder ", ffname, ":", name, "deleted successfully \n")
    }
}
# API: http://apidocs.mendeley.com/user-library-delete-folder
