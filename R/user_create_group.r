#'createGroup - Create a new group in your Mendeley library.
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group_name Name of your group.
#'@param  type Three types of groups are allowed: 'private', 'invite' and 'open'.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' createGroup(mc, 'new_group_name')
#' createGroup(mc, 'new_group_name', type="open")
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
createGroup <- function(mc = NULL, group_name = NULL, type = "invite",
    ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    content <- toJSON(list(name = group_name, type = type), collapse = "")
    val <- OAuthRequest(mc, "http://www.mendeley.com/oapi/library/groups/",
        list(group = content), "POST")
    ans <- fromJSON(val)
    cat ("Successfully created ", group_name, "\n")
    new("MendeleyGroupID", as.character(ans))
}
# API:  http://api.mendeley.com/oapi/library/groups/
