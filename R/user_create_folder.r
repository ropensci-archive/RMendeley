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
user_create_folder <- function(mendeley_cred, name = NULL)
{
    if (!is(mendeley_cred, "MendeleyCredentials") ||  missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.", call.= FALSE)

  if(length(name) > 1)
     return(lapply(name, function(x) createFolder(cred, x, curl = curl)))

 folder_obj <- toJSON(list(name = name), collapse = "")  #!!! Note the collapse. Mendeley doesn't like the newlines.
  ans <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/folders/", list(folder = folder_obj) , "POST")  # c(folder = folder_obj) also works.
  cat ("New folder successfully created \n")
  new("MendeleyFolderID", fromJSON(ans))

}
# API: http://apidocs.mendeley.com/user-library-create-folder
# Verification of signature errors.
# A link to discussion on the verificatione errors:
# https://groups.google.com/forum/?fromgroups#!topic/mendeley-open-api-developers/ncau3VlOrYw
