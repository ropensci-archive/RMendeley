#' msearch.R   Search Method (Public Method)
#' @param query any search query. Can use the options:
#' authors, year, title, published_in, followed by colons
#' e.g. authors:Alistair Boettiger published_in:Science
#' @param page number pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query for the author
#' @details see \url{http://apidocs.mendeley.com/home/public-resources/search-terms}
#' @examples \dontrun{
#'  a = msearch("bob", , 20)
#'  b = msearch("bob", 4, 20)
#'  d = msearch("authors:Alistair Boettiger published_in:Science")
#'  # Get the DOIs of Journal of Ecology hits (returns first 999 exact matches)
#'   all <- msearch("published_in:\"Journal of Ecology\"")
#'   dois <- sapply(all, function(x) x$doi)
#' }
#' @export
msearch =
function(query, page = NA, numItems = 1000L, key = getOption("MendeleyKey", 
         stop("need an API key for Mendeley")), curl=getCurlHandle(), ...)
{

   # httr could probably handle this better!
   query <- gsub(":", "%3A", query) # use html symbol for colons
   query <- gsub(" ", "%20", query) # use html symbol for spaces
   query <- gsub("\"", "%22", query) # use html symbol for quotes
   url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/search", query)
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   out <- fromJSON(I(tt))
   out[[1]]
}
