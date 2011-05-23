# papers.R Stats Method (Public Method)

papers =
function(discipline = NULL, upandcoming = FALSE, url = "http://api.mendeley.com/oapi/stats/papers/",
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")), ..., curl=getCurlHandle())
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
