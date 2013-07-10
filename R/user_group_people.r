#' groupPeople  - returns list of group members and their Mendeley user IDs
#'
#'
#'@param mc Your Mendeley OAuth credential.
#'@param  group_name Name of group
#'@seealso user_groups
#'@return list
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export groupPeople
#'@examples \dontrun{
#' groupPeople(mc, 'Future of Science')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
groupPeople <- function(mc = NULL, group_name = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group_name)) {
        stop("You did not specifiy a group name", call. = FALSE)
    }
    id <- getGroupID(mc, group_name)

    group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/people", id)
    groups_people <- suppressWarnings(OAuthRequest(mc, group_url, , "GET"))
    groups_people <- fromJSON(groups_people)
    format_groups <- function(group_peeps) {
        x1 <- ldply(group_peeps[[1]])
        names(x1) <- c("user_id", "name")
        x1 <- x1[-1, ]
        x1$status <- "owner"
        x2 <- ldply(group_peeps[[2]])
        if (dim(x2)[2] > 0) {
            x2$status <- "admin"
        }
        x3 <- ldply(group_peeps[[3]])
        if (dim(x3)[2] > 0) {
            x3$status <- "followers"
        }
        x4 <- ldply(group_peeps[[4]])
        x4$status <- "members"
        return(rbind(x1, x2, x3, x4))
    }
    return(format_groups(groups_people))
}
# Errors:
# Warning message:
# In RCurlIconv(str, from = 'C99', to = encoding) :
#   C99 not supported iconv entries
# Calls: user_group_people ... getURLContent -> <Anonymous> -> encode -> RCurlIconv
# http://api.mendeley.com/oapi/library/groups/<group_id>/people/
# http://api.mendeley.com/oapi/library/groups/1377653/people/
#  1377653
# http://api.mendeley.com/oapi/library/groups/564031/people/
