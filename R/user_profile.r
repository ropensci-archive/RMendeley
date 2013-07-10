#'mendeley_profile - Displays your user profile.
#'
#'
#'@param mc Mendeley OAUth credentials.
#'@param mendeley_user_id Mendeley ID of the user you wish to look up. Leave blank to retrieve your own profile.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export mendeley_profile
#'@examples \dontrun{
#' mendeley_profile(mc, '39369') # If left blank, it will retrieve your profile.
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
mendeley_profile <- function(mc = NULL, mendeley_user_id = NULL, ...,
    curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    base_url <- "http://api.mendeley.com/oapi/profiles/info/"
    profile_url <- ifelse(is.null(mendeley_user_id), paste(base_url, "me", sep = ""),
        paste(base_url, mendeley_user_id, sep = ""))
    user_profile_info <- OAuthRequest(mc, profile_url, , "GET")
    user_profile_info <- fromJSON(user_profile_info)
    return(user_profile_info)
}
