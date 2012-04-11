#' Folders - retuns a list of your Mendeley folders with sizes
#'
#'
#'@param mendeley_cred Your Mendeley ROAuth credential.
#'@return list
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_folders(mendeley_cred)
#'}
Folders <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    mendeley_folders <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/folders/",
        , "GET")
    mendeley_folders <- fromJSON(mendeley_folders)
    add_parent <- function(df) {
        d <- t(data.frame(df))
        d <- as.data.frame(d)
        if (dim(d)[2] == 3) {
            d$parent <- "none"
        }
        return(d)
    }
    return(ldply(mendeley_folders, add_parent))
}


#' getFolderID - retrieves Folder ID from folder name
#'
#'@param mendeley_cred Your Mendeley ROAuth credential.
#' @param  name Folder name
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#' @export
#' @examples \dontrun{
#' getFolderID(mendeley_cred, 'folder_name')
#'}
getFolderID <- function(mendeley_cred = NULL, name, ..., curl = getCurlHandle()) {
    fl <- user_folders(mendeley_cred, curl = curl)
    i <- which(fl$name == name)
    subs <- fl[i,]
    if (dim(subs)[1]==0)
        stop("Cannot find folder")
    if (dim(subs)[1]>1)
        stop("Found more than one match \n")
    flID <- subs$id
    return(flID)
}

