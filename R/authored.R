#' authored.R   Search Method (Public Method)
#' @param query an author name to query
#' @param page number pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param year restrict results to publications appearing in that year (optional)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query for the author
#' @examples \dontrun{
#' a <- authored("Boettiger")
#' b <- authored("Boettiger", num = 10) 
#' b$documents
#' a$total_results 
#' }
#' @export
authored =
function(query, page = NA, numItems = 1000L, year=NA, 
         key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
         url = 
         sprintf("%s/%s","http://api.mendeley.com/oapi/documents/authored",
         gsub(" ", "%20", query)), curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(year))
      args$year = as.character(year)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   out <- fromJSON(I(tt))
   out[[1]] 
}
