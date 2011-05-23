# authors.R Stats Method (Public Method)

authors =
# Returns list of all-time top authors across all disciplines, unless optional params used.
# Examples: 
#   authors()
#   authors(discipline="6") # Discipline "6", Computer Science
function(discipline = NULL, upandcoming = FALSE, url = "http://api.mendeley.com/oapi/stats/authors/",
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")), ...,
           curl = getCurlHandle())
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
