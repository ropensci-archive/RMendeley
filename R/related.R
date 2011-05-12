# related.R a Search Method (Public Method)
related =
  # Examples: 
  # b <- related("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid 
  # 
function(query, page = NA, numItems = 1000L, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/related", query))
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
