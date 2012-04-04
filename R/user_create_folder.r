#'createFolder - Create a folder in your Mendeley library
#'@param mendeley_cred Your Mendeley OAUth credentials
#'@param  name Name of your new folder
#'@param curl Optionsal. If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options. Useful for debugging purposes.
#'@return JSON object of class \code{MendeleyFolderID} containing your folder ID if successful.
#'@export
#'@examples \dontrun{
#' user_create_folder(...)
#'}
createFolder <- function(mendeley_cred = NULL, name = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (length(name) > 1)
        return(lapply(name, function(x) createFolder(mendeley_cred, x, curl = curl)))
    folder_obj <- toJSON(list(name = name), collapse = "")  #!!! Note the collapse. Mendeley doesn't like the newlines.
    ans <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/folders/",
        list(folder = folder_obj), "POST")  # c(folder = folder_obj) also works.
    cat("New folder successfully created \n")
    new("MendeleyFolderID", fromJSON(ans))
}
# API: http://apidocs.mendeley.com/user-library-create-folder
