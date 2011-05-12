# public_groups_overview.R   Public Group Methods (Public Methods)

public_groups_overview =
  # This method will return a list of public groups available on Mendeley sorted by number of members.
  # Examples: 
  #   public_groups_overview() 
  # 
function(page = NA, numItems = 1000L, cat=NA, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = "http://api.mendeley.com/oapi/documents/groups")
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(cat))
      args$cat = as.character(cat)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
