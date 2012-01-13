#' tags.R a Stats Method (Public Method)
#'
#' @param discipline a numeric code indicating the discipline
#' Discipline id numbers can be displayed by the categories() function
#' @param upandcoming logical: give recent/trending top authors only?
#' @param url Mendeley API URL (don't change this)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @examples \dontrun{
#'   tags()
#'   tags("6")  # Discipline "6", Computer Science
#' }
#' @keywords public method stats
#' @import RCurl 
#' @import RJSONIO
#' @export
tags =
function(discipline, upandcoming = FALSE, url = sprintf("%s/%s", "http://api.mendeley.com/oapi/stats/tags/", discipline), 
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")), curl=getCurlHandle(), ...)
{
 args = list(consumer_key = key)
 args$discipline = as.character(discipline)
 if(as.logical(upandcoming))
     args$upandcoming = 1L  # why express integers this way
  
  tt = getForm(url, .params = args, .opts=list(...), curl=curl)
  ans = fromJSON(tt)
  structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
