#' query for documents in a given group
#' @param query a group name to query
#' @param page number of pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param cat see Mendeley documentation 
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query for the author
#' @export
groups =
function(query, page=NA,numItems=10,cat=NA, 
         url ="http://api.mendeley.com/oapi/documents/groups/", 
         key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
         curl=getCurlHandle(), ...)
{
  args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
  if(!is.na(numItems))
      args$items = as.integer(numItems)
     if(!is.na(cat))
      args$cat = as.integer(cat)
      
  tt = getForm(url, .params = args, .opts=list(...), curl=curl)
  ans = fromJSON(tt)
  ans[[1]]
}

