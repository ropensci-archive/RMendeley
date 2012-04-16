#' myGroups - returns a list of Mendeley groups that you belong to.
#'
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@return data.frame
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' myGroups(mc)
#'}
myGroups <- function(mc = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    mendeley_groups <- OAuthRequest(mc, "http://api.mendeley.com/oapi/library/groups/",
        , "GET")
    mendeley_groups <- fromJSON(mendeley_groups)
    mendeley_groups <- ldply(mendeley_groups, function(x) as.data.frame(x))
    return(mendeley_groups)
}
