
#' related.R a Search Method (Public Method)
#'
#' Return a list of papers related to a given Mendeley uuid
#' @param query any Mendeley uuid (see details() function) 
#' @param page number pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query related =
#' @details See \url{http://apidocs.mendeley.com/home/public-resources/search-related} 
#' @examples \dontrun{
#' b <- related("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid 
#' }
#' @export
related <- 
function(query, page = NA, numItems = 1000L, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/related", query), curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   fromJSON(I(tt))
}
