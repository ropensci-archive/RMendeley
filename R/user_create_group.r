#'createGroup - Create a new group in the user's library.
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  group_name Name of your group.
#'@param  type Three types of groups are allowed: 'private', 'invite' and 'open'.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_create_group(...)
#'}
createGroup <- function(mendeley_cred = NULL, group_name = NULL, type = "invite",
    ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    content <- toJSON(list(name = group_name, type = type), collapse = "")
    val <- OAuthRequest(mendeley_cred, "http://www.mendeley.com/oapi/library/groups/",
        list(group = content), "POST")
    ans <- fromJSON(val)
    cat ("Successfully created ", group_name, "\n")
    new("MendeleyGroupID", as.character(ans))
}
# API:  http://api.mendeley.com/oapi/library/groups/
