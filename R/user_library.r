#'mendeley_library - allows authenticated users to retrieve all the documents in their library.
#'
#'
#'@param mendeley_cred Your Mendeley ROauth credentials.
#'@param  page  Page number of search results
#'@param  items  Number of items per page
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_library(mendeley_cred)
#' user_library(mendeley_cred, 2)
#' user_library(mendeley_cred, 1, 25)
#'}
mendeley_library <- function(mendeley_cred = NULL, page = NULL, items = NULL, ...,
    curl = getCurlHandle()) {
    lib_url <- ""
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    lib_opts <- list()
    if (!is.null(page)) {
        lib_opts$page <- page
    }
    if (!is.null(items)) {
        lib_opts$items <- items
    }
    library <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/",
        lib_opts, "GET")
    library <- fromJSON(library)
    return(library)
}
