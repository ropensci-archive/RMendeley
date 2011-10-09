groups =
function(query, page=NA,numItems=10,cat=NA, url ="http://api.mendeley.com/oapi/documents/groups/", 
          key = getOption("MendeleyKey", stop("need an API key for Mendeley")))
{
  args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
  if(!is.na(numItems))
      args$items = as.integer(numItems)
     if(!is.na(cat))
      args$cat = as.integer(cat)
      
  tt = getForm(url, .params = args)
  ans = fromJSON(tt)
}

