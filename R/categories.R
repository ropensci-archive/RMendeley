#' Returns a list of Mendeley's categories
#' @param key Mendeley API key (otherwise will try and load from server)
#' @param url Mendeley API URL (don't change this)
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @examples \dontrun{
#'  categories()
#' }
#' @keywords public method stats
#' @export
categories <- function(key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
    url = "http://api.mendeley.com/oapi/documents/categories/", ..., curl = getCurlHandle()) {
    args <- list(consumer_key = key)
    tt <- getForm(url, .params = args, .opts = list(...), curl = curl)
    fromJSON(I(tt))
}
# Trying to rewrite an old working fuction using the new auth. Fails with the same verification errors as the other non-working functions. Clearly this has something to do with malformed args?
# # Below DOES NOT WORK.
# categories <- function(mc = NULL)
# {
#     if (!is(mc, 'MendeleyCredentials') ||  missing(mc))
#         stop('Invalid or missing Mendeley credentials. ?mendeley_auth for more information.', call.= FALSE)
# 	categories <- OAuthRequest(mc, 'http://api.mendeley.com/oapi/documents/categories/', , 'GET')
# 	categories <- fromJSON(categories)
# 	categories <- ldply(categories, function(x) as.data.frame(x))
#     return(categories)
# }
