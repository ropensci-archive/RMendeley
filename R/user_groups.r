#' myGroups - returns a list of Mendeley groups
#'
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@return data.frame
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' mendeley_groups(mendeley_cred)
#'}
myGroups <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    mendeley_groups <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/groups/",
        , "GET")
    mendeley_groups <- fromJSON(mendeley_groups)
    mendeley_groups <- ldply(mendeley_groups, function(x) as.data.frame(x))
    return(mendeley_groups)
}


#' Get a Group ID from group name
#'
#' Meant for internal use.
#' @param mendeley_cred <what param does>
#' @param  group Name of group
#' @param ... <what param does>
#' @param  curl = getCurlHandle() <what param does>
#' @export
#' @return numeric
#' @examples \dontrun{
#' getGroupID(mendeley_cred, '')
#'}
getGroupID <- function(mendeley_cred = NULL, group = NULL,..., curl = getCurlHandle()) {

 if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
    }

groups <- myGroups(mendeley_cred, curl = curl)
selected_group <- groups[which(groups$name==group),]

if(dim(selected_group)[1]==0)
    stop("No matching group found", call.=F)

if(dim(selected_group)[1]>2)
    stop("Multiple groups found. Please check the name", call.=F)

return(selected_group$id)
}
