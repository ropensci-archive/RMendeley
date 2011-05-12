# subcategories.R Search Method (Public Method)
# Returns sub categories of the main category
subcategories =
  # Examples: 
  # a <- subcategories("Phylogenetic Methods") 
  #
  # 
function(query, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/subcategories/", query))
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
