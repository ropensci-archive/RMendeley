#' details Search Method (Public Method)
#' @param query an object identifer of type identified by type
#' @param type the type of object identifier to use
#' @param url Mendeley API URL (don't change this)
#' @param key Mendeley API key (otherwise will try and load from server)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly)
#' @return the details of the paper being queried
#' @examples \dontrun{
#' ali <- details("10.1073/pnas.0810311106", type="doi") 
#'  a <- details("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid
#' }
#' @export
details = function(query, type=c("mendeley", "arxiv", "doi", "isbn", "pmid", "scopus", "ssm"), 
         key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
         url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/details", query),
         curl=getCurlHandle(), ...)
{
   type = match.arg(type)
   args = list(consumer_key = key)
   if(type != "mendeley")
     args$type = as.character(type)

   tt = getForm(url, .params = args, .opts = list(...), curl = curl)
   fromJSON(I(tt))
}
