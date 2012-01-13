#' authors Stats Method (Public Method)
#' 
#' Returns list of top authors of given disipline or overall 
#' @param discipline a numeric code indicating the discipline
#' @param upandcoming logical: give recent/trending top authors only?
#' @param url Mendeley API URL (don't change this)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @examples \dontrun{
#'   authors()
#'   authors(discipline="6") # Discipline "6", Computer Science
#' }
#' @keywords public method stats
#' @import RCurl 
#' @import RJSONIO
#' @export
authors <- function(discipline = NULL, upandcoming = FALSE, 
         url = "http://api.mendeley.com/oapi/stats/authors/",
         key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
         ..., curl = getCurlHandle())
{
  args = list(consumer_key = key)
  if(!is.null(discipline))
     args$discipline = as.character(discipline)
  if(as.logical(upandcoming))
     args$upandcoming = 1L # L means as integer, not numeric (double)
  
  tt = getForm(url, .params = args, .opts = list(...), curl = curl)
  ans = fromJSON(tt)
  structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
