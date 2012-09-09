#'deleteGroup - Delete a group for which you have owner permissions.
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param  ask logical. Default is TRUE to verify deletion. To skip this step, set ask to FALSE.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' deleteGroup(mc, 'group name')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
deleteGroup <- function(mc, group, ask = TRUE, ..., curl = getCurlHandle()) {
    if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

      # getGroupID now returns a MendeleyGroupID.  It should not return a factor.
    id <- if(!is(group,"MendeleyGroupID"))
            getGroupID(mc, group)
          else
            group

      # The trailing / is essential here.
    del_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/", id)

    reader = dynCurlReader(curl, del_group_url, binary = FALSE)
if (ask) {
        verify <- readline(paste("Are you sure you want to delete",
            group, " (Y/N)? "))
        verify <- toupper(verify)
        if (verify != "Y" & verify != "N") {
            stop("Unexpected response. \n", call. = F)
        }
    }
    if (verify == "Y" || !(ask)) {
    OAuthRequest(mc, del_group_url, , "DELETE", ..., followlocation = TRUE,
                      .addwritefunction = FALSE, headerfunction = reader$update)
        # We really want the HTTP response header and to check the status, not whether its body is ""
    hdr = parseHTTPHeader(reader$header())
    as.integer(hdr["status"]) %/% 100 == 2
            }
  }
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group


#'The following methods will quit membership from a group
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' leaveGroup(mc, ...)
#'}
leaveGroup <- function(mc = NULL, group = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
    }
    id <- getGroupID(mc, group)
    leave_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/LEAVE", id)
    browser()
    leave_group <- OAuthRequest(mc, leave_group_url, ,"DELETE")
    if(leave_group=="") {
        cat ("You have successfully left", group, "\n")
        } else {
    return(leave_group)
    }
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group


#'The following methods will essentially delete a group from the user's library.
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' unfollowGroup(mc, ...)
#'}
unfollowGroup <- function(mc = NULL, group = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
    }
    id <- getGroupID(mc, group)
    unfollow_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/unfollow", id)
    browser()
    unfollow_group <- OAuthRequest(mc, unfollow_group_url, , "DELETE")
    if(unfollow_group=="") {
        cat ("You have successfully unfollowed ", group, "\n")
        } else {
    return(unfollow_group)
    }
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group


#' Get a Group ID from group name
#'
#' Meant for internal use.
#' @param mc <what param does>
#' @param  group Name of group
#' @param ... <what param does>
#' @param  curl = getCurlHandle() <what param does>
#' @export
#' @return numeric
#' @examples \dontrun{
#' getGroupID(mc, '')
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
  selected_group <- groups[which(groups$name==group),]

  if(dim(selected_group)[1]==0)
      stop("No matching group found", call.=F)

  if(dim(selected_group)[1]>2)
    stop("Multiple groups found. Please check the name", call.=F)
  return(new("MendeleyGroupID", as.character(selected_group$id)))

}

setClass("MendeleyID", contains = "character")
setClass("MendeleyGroupID", contains = "MendeleyID")

