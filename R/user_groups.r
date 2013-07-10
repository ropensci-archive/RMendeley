#' myGroups - returns a list of Mendeley groups that you belong to.
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
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
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


#' getGroupID
#'
#'Retrieves Mendeley Group ID from a Mendeley Group Name
#' @param mc OAuth object of class MendeleyCredentials
#' @param group Group Name
#' @param ... additional (optional) parameters
#' @param curl curl handle
#' @export
#' @examples \dontrun{
#' getGroupID(mc, "Future of Science")
#'}
getGroupID <- function(mc = NULL, group = NULL,..., curl = getCurlHandle()) {
name <- NA
 if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

 if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
 }

  groups <- myGroups(mc, curl = curl)
  selected_group <- groups[which(groups[,1]==group)-1,]

  if(length(selected_group)==0)
      stop("No matching group found", call.=F)

  if(length(selected_group)>=2)
    stop("Multiple groups found. Please check the name", call.=F)
  return(new("MendeleyGroupID", as.character(selected_group)))
}
