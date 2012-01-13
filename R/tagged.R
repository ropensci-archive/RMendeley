#' tagged.R   Search Method (Public Method)
#' @param query any possible tag in Mendeley 
#' @param page number pages to return (optional)
#' @param cat Only tags appearing in this subject category
#' See the search-categories function to obtain a list of the numeric
#' codes corresponding to each of the main subject categories.  
#' @param subcat a subcategory to restrict searching to
#' @param numItems number of hits to return (optional)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query 
#' @examples \dontrun{
#' a <- tagged("phylogenetics") 
#' b <- tagged("phylogenetics", cat=3)  # biological sciences
#' }
#' @export
tagged =
function(query, page = NA, numItems = 1000L, cat=NA, subcat=NA, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/tagged", query), curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(cat))
      args$cat = as.character(cat)
   if(!is.na(subcat))
      args$subcat = as.character(subcat)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   out <- fromJSON(I(tt))
   out[[1]]
}
