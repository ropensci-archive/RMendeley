# public_groups_documents.R   Public Group Methods (Public Methods)


public_groups_documents =
  # Returns list of documents ids within a public group. It is possible 
  # to retrieve documents details in the same request setting the optional parameter details to true.
  # 
  # Examples: 
  #   public_groups_documents(492511) 
  # 
function(query, details=FALSE, page = NA, numItems = 1000L, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s/%s", "http://api.mendeley.com/oapi/documents/groups", query, "docs/?details=true"))
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(details) # logical
      args$details = as.character("true")
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
