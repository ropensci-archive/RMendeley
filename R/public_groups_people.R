# public_groups.people.R   Public Group Methods (Public Methods)
public_groups_people =
  # This method will return further people about a group. 
  # Examples: 
  #   public_groups_people(492511) 
  # 
function(query, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s/%s", "http://api.mendeley.com/oapi/documents/groups", query, "people"))
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
