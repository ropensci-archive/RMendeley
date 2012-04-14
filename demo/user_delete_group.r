#'deleteGroup - The following methods will essentially delete a group from the user's library.
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_delete_group(mendeley_cred, ...)
#'}
deleteGroup <- function(mendeley_cred, group, ..., curl = getCurlHandle()) {
      # no need to test for missing(), it will just fail using R's usual evaluation rules.
      # Also, no use in checking is(cred, "M...") and then missing(). 

    if (!is(mendeley_cred, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

      # getGroupID now returns a MendeleyGroupID.  It should not return a factor.
    id <- if(!is(group,"MendeleyGroupID"))
            getGroupID(mendeley_cred, group)
          else
            group
    
      # The trailing / is essential here.
    del_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/", id)
    delete_group <- OAuthRequest(mendeley_cred, del_group_url, , "DELETE", ..., followlocation = TRUE)
    
      #XXX We really want the HTTP response header and to check the status, not whether its body is ""
    delete_group == ""
  }
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group


#'The following methods will quit membership from a group
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_delete_group(mendeley_cred, ...)
#'}
leave_group <- function(mendeley_cred = NULL, group = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
    }
    id <- getGroupID(mendeley_cred, group)
    leave_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/LEAVE", id)
    browser()
    leave_group <- OAuthRequest(mendeley_cred, leave_group_url, ,"DELETE")
    if(leave_group=="") {
        cat ("You have successfully left", group, "\n")
        } else {
    return(leave_group)
    }
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/user-library-delete-group


#'The following methods will essentially delete a group from the user's library.
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  group group id.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_delete_group(mendeley_cred, ...)
#'}
unfollow_group <- function(mendeley_cred = NULL, group = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group)) {
        stop("Group name is missing", call. = FALSE)
    }
    id <- getGroupID(mendeley_cred, group)
    unfollow_group_url <- sprintf("http://api.mendeley.com/oapi/library/groups/%s/unfollow", id)
    browser()
    unfollow_group <- OAuthRequest(mendeley_cred, unfollow_group_url, , "DELETE")
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

  return(new("MendeleyGroupID", as.character(selected_group$id)))
}

setClass("MendeleyID", contains = "character")
setClass("MendeleyGroupID", contains = "MendeleyID")
 
