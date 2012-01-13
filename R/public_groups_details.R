#' public_groups.details.R   Public Group Methods (Public Methods)
#' 
#' This method will return further details about a group. 
#' @param query a public group ID number
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param url the Mendeley API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return detailed metadata  for all articles in the public group 
#' @examples \dontrun{
#' public_groups_details(492511) 
#' }
#' @export
public_groups_details =
function(query, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/groups", query), curl=getCurlHandle(), ...)
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args, .opts=list(...), curl=curl)
   fromJSON(I(tt))
}
