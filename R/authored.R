# authored.R   Search Method (Public Method)
authored =
  # Examples: 
  # a <- authored("Boettiger")
  # b <- authored("Boettiger", num = 10) 
  # b$documents
  # a$total_results 
  # num works, year doesn't seem to do anything 
function(query, page = NA, numItems = 1000L, year=NA, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/authored", query))
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(year))
      args$year = as.character(year)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
