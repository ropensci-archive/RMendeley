#'mendeley_library - Returns a list of all the documents in your library.
#'
#'
#'@param mc Your Mendeley ROauth credentials.
#'@param  page  Page number of search results
#'@param  items  Number of items per page
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' mendeley_library(mc)
#' mendeley_library(mc, 2)
#' mendeley_library(mc, 1, 25)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
mendeley_library <- function(mc = NULL, page = NULL, items = NULL, ...,
    curl = getCurlHandle()) {
    lib_url <- ""
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    lib_opts <- list()
    if (!is.null(page)) {
        lib_opts$page <- page
    }
    if (!is.null(items)) {
        lib_opts$items <- items
    }
    library <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/",
        lib_opts, "GET")
    library <- fromJSON(library)
    return(library)
}
