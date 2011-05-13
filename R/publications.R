# publications.R: A Stats Method (Public Methods)
publications =
function(discipline = NULL, upandcoming = FALSE, url = "http://api.mendeley.com/oapi/stats/publications/",
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")))
{
  args = list(consumer_key = key)
  if(!is.null(discipline))
     args$discipline_id = as.character(discipline)
  if(as.logical(upandcoming))
     args$upandcoming = 1L
  
  tt = getForm(url, .params = args)
  ans = fromJSON(tt)
# structure(sapply(ans, `[[`, 2), names = sapply(ans, `[[`, 1))
}
