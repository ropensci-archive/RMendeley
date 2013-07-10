#' authored.R   Search Method (Public Method)
#' @param query an author name to query
#' @param page number pages to return (optional)
#' @param key Mendeley public key
#' @param numItems number of hits to return (optional)
#' @param year restrict results to publications appearing in that year (optional)
#' @param ... optional additional curl options (debugging tools mostly)
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @return all results matching the query for the author
#' @examples \dontrun{
#' a <- authored("Boettiger")
#' b <- authored("Boettiger", num = 10)
#' b$documents
#' a$total_results
#' }
#' @export
authored <- function(query,  page = NA, numItems = 100L, year=NA, key = getOption("MendeleyKey", stop("need an API key for Mendeley")), curl=getCurlHandle(), ...)
{
	browser()
q_url <- sprintf("%s/%s","http://api.mendeley.com/oapi/documents/authored", gsub(" ", "%20", query))
args <- list(consumer_key = key)
    result <- getForm(q_url, .params = args, .opts = list(...), curl = curl)
    fromJSON(I(result))
}
