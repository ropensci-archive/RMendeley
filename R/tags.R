# tags.R a Stats Method (Public Method)
tags =
function(discipline, upandcoming = FALSE, url = sprintf("%s/%s", "http://api.mendeley.com/oapi/stats/tags/", discipline), 
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")))
{
  args = list(consumer_key = key)
  if(as.logical(upandcoming))
     args$upandcoming = 1L  # why express integers this way
  
  tt = getForm(url, .params = args)
  ans = fromJSON(tt)
  structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
