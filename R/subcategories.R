#' Returns a list of Mendeley's subcategories
#' @param cat subject category id 
#' @param key Mendeley API key (otherwise will try and load from server)
#' @param url Mendeley API URL (don't change this)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @examples \dontrun{
#'  subcategories()
#' }
#' @keywords public method stats
#' @export
subcategories =
function(cat, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/subcategories/", cat),
          curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   fromJSON(I(tt))
}
