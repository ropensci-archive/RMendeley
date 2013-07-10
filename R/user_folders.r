#' Folders - retuns a list of your Mendeley folders with sizes.
#'
#'
#'@param mc Your Mendeley ROAuth credential.
#'@return list
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export Folders
#'@examples \dontrun{
#' Folders(mc)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
Folders <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    mendeley_folders <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/folders/",
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
#'@param mc Your Mendeley ROAuth credential.
#' @param  name Folder name
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#' @export getFolderID
#' @examples \dontrun{
#' getFolderID(mc, 'folder_name')
#'}
getFolderID <- function(mc = NULL, name, ..., curl = getCurlHandle()) {
    fl <- Folders(mc, curl = curl)
    i <- which(fl$name == name)
    subs <- fl[i,]
    if (dim(subs)[1]==0)
        stop("Cannot find folder")
    if (dim(subs)[1]>1)
        stop("Found more than one match \n", call.=FALSE)

            flID <- subs$id
          return(new("MendeleyFolderID", as.character(flID)))
}

