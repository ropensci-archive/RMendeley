#'Gives you a list of Mendeley groups
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@return data.frame
#' @param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' mendeley_groups(mendeley_cred)
#'}
user_groups <- function(mendeley_cred, ..., curl = getCurlHandle())
{
    if (!is(mendeley_cred, "MendeleyCredentials") ||  missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.", call.= FALSE)
	mendeley_groups <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/groups/", , "GET")
	mendeley_groups <- fromJSON(mendeley_groups)
	mendeley_groups <- ldply(mendeley_groups, function(x) as.data.frame(x))
    return(mendeley_groups)
}
