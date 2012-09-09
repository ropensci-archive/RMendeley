# addFolderDoc - Add folder to a document.
#'
#'Allows authenticated users to add a document to an specific folder. The document must exists on the library
#'@param mc OAuth object of class MendeleyCredentials
#'@param  folder Folder Name
#'@param  doc document...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' addFolderDoc(mc, '23423', '12321312')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
addFolderDoc <- function(mc = NULL, folder, doc, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    u <- sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/", folder, doc)
    ans <- OAuthRequest(mc, u, method = "POST", ..., curl = curl)
    if (ans == "") {
        cat("success \n")
    } else {
         new("MendeleyGroupID", as.character(ans))
        return(fromJSON(ans))
    }
}
# API: http://apidocs.mendeley.com/user-library-add-document-to-folder
