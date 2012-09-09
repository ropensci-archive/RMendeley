#' addContact - Add a contact on Mendeley
#'
#' Add contacts to your Mendeley profile from R.
#' Add another Mendeley user as a contact with their Mendeley ID.
#'@param mc OAuth object of class MendeleyCredentials
#'@param  mendeley_user_id Mendeley user id of your contact.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@seealso user_contacts
#'@examples \dontrun{
#' addContact(mc, '12356')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
addContact <- function(mc = NULL, mendeley_user_id = NULL, ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(mendeley_user_id)) {
        stop("You did not specifiy the ID for your contact", call. = FALSE)
    }
    add_url <- paste("http://api.mendeley.com/oapi/profiles/contacts/", mendeley_user_id,
        "/", sep = "")
    add <- OAuthRequest(mc, add_url, , "POST")
    return(fromJSON(add))
}
# API DOC: http://apidocs.mendeley.com/home/user-specific-methods/user-profile-add-contact
# Has verification errors like like user_create_folder()
# testing
# add_url <- 'http://api.mendeley.com/oapi/profiles/contacts/5089461/'
# OAuthRequest(mc, add_url, , 'POST')
