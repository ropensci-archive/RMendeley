# categories.R Search Method (Public Method)
# Returns a list of categories
categories =
  # Examples: 
  # a <- categories() 
  #
  # 
function( key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = "http://api.mendeley.com/oapi/documents/categories/")
{
   args = list(consumer_key = key)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
