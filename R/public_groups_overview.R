#' public_groups_overview.R   Public Group Methods (Public Methods)
#' 
#' This method will return a list of public groups available on Mendeley sorted by number of members.
#' @param page number pages to return (optional)
#' @param numItems number of hits to return (optional)
#' @param cat Only tags appearing in this subject category
#' See the search-categories function to obtain a list of the numeric
#' codes corresponding to each of the main subject categories.  
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return detailed metadata  for all articles in the public group 
#' @examples \dontrun{
#'  public_groups_overview() 
#' }
#' @export
public_groups_overview =
function(page = NA, numItems = 1000L, cat=NA, 
         key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
         url = "http://api.mendeley.com/oapi/documents/groups", curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(cat))
      args$cat = as.character(cat)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   fromJSON(I(tt))
}
