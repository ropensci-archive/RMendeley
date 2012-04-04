#'mendeley_profile - returns profile of a Mendeley user
#'
#'
#'@param mendeley_cred Mendeley OAUth credentials.
#'@param mendeley_user_id ...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export mendeley_autH
#'@examples \dontrun{
#' user_profile(mendeley_cred, '39369') # If left blank, it will retrieve your profile.
#'}
mendeley_profile <- function(mendeley_cred = NULL, mendeley_user_id = NULL, ...,
    curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    base_url <- "http://api.mendeley.com/oapi/profiles/info/"
    profile_url <- ifelse(is.null(mendeley_user_id), paste(base_url, "me", sep = ""),
        paste(base_url, mendeley_user_id, sep = ""))
    user_profile_info <- OAuthRequest(mendeley_cred, profile_url, , "GET")
    user_profile_info <- fromJSON(user_profile_info)
    return(user_profile_info)
}
