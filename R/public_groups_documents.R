#' public_groups_documents.R   Public Group Methods (Public Methods)
#' 
#' Returns list of documents ids within a public group. It is possible 
#' @param query a public group ID number
#' @param details if detailed information (public_group_details) should be
#' returned; logical, default is FALSE
#' @param page number pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#' the returned value in here (avoids unnecessary footprint)
#' @return detailed metadata  for all articles in the public group 
#' @details to retrieve documents details in the same request setting the
#' optional parameter details to true.
#' @examples \dontrun{
#' public_groups_details(492511) 
#' }
#' @export
public_groups_documents =
function(query, details=FALSE, page = NA, numItems = 1000L, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s/%s", "http://api.mendeley.com/oapi/documents/groups", query, "docs/?details=true"), curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(details) # logical
      args$details = as.character("true")
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   ans = fromJSON(I(tt))
   ans[[1]]
}
