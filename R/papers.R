#' papers.R Stats Method (Public Method)
#' @param discipline a numeric code indicating the discipline
#' @param upandcoming logical: give recent/trending top authors only?
#' @param url Mendeley API URL (don't change this)
#' @param key Mendeley API key (otherwise will try and load from package)
#' @param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @examples \dontrun{
#' papers()
#' papers(6) # top papers in a discipline (id 6 = Computer Science)
#' }
#' @export
papers =
function(discipline = NULL, upandcoming = FALSE,
  url = "http://api.mendeley.com/oapi/stats/papers/",
  key = getOption("MendeleyKey",
  stop("need an API key for Mendeley")), ..., curl=getCurlHandle())
{
  args = list(consumer_key = key)
  if(!is.null(discipline))
     args$discipline = as.character(discipline)
  if(as.logical(upandcoming))
     args$upandcoming = 1L

  tt = getForm(url, .params = args, .opts=list(...), curl=curl)
  ans = fromJSON(tt)
 structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
