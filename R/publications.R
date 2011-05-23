# publications.R: A Stats Method (Public Methods)
publications =
# discipline is the numerical id, see categories() for a list
# Example: plublications("6", up=T, verbose=T)
function(discipline = NULL, upandcoming = FALSE, url = "http://api.mendeley.com/oapi/stats/publications/",
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")), ..., curl=getCurlHandle())
{
  args = list(consumer_key = key)
  if(!is.null(discipline))
     args$discipline = as.character(discipline)
  if(as.logical(upandcoming))
     args$upandcoming = 1L
  
  tt = getForm(url, .params = args, .opts=list(...), curl=curl)
  ans = fromJSON(tt)
# structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
