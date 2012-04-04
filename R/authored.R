#' authored.R   Search Method (Public Method)
#' @param mendeley_cred OAuth object of class MendeleyCredentials
#' @param query an author name to query
#' @param page number pages to return (optional)
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
authored <-
function(mendeley_cred = NULL, query, page = NA, numItems = 100L, year=NA, curl=getCurlHandle(), ...)
{

# sprintf("%s/%s","http://api.mendeley.com/oapi/documents/authored",
#          gsub(" ", "%20", query))
}
