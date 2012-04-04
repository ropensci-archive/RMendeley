# addFolderDoc - Add folder to a document. [need to code up]
#'
#'Allows authenticated users to add a document to an specific folder. The document must exists on the library
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  folder foo
#'@param  doc document...
#' @param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_add_doc_folder(mendeley_cred, ...)
#'}
addFolderDoc <- function(mendeley_cred = NULL, folder, doc, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    u <- sprintf("%s%s/", as(folder, "URL"), as(doc, "character"))
    ans <- OAuthRequest(mendeley_cred, u, method = "POST", ..., curl = curl)
    if (ans == "") {
        cat("success \n")
    } else {
        return(fromJSON(ans))
    }
}
# API: http://apidocs.mendeley.com/user-library-add-document-to-folder
