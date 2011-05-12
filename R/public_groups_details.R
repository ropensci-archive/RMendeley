# public_groups.details.R   Public Group Methods (Public Methods)
public_groups_details =
  # This method will return further details about a group. 
  # Examples: 
  #   public_groups_details(492511) 
  # 
function(query, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/groups", query))
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
