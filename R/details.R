# detail.R Search Method (Public Method)

details =
 # ali <- details("10.1073\\/pnas.0810311106", type="doi") ## Returns the wrong paper!  others don't return any papers
 # a <- details("cabcbae0-839b-11df-aedb-0024e8453de8") # uuid
 # b <- details("10.1088\\/0953-8984\\/22\\/19\\/194101", type="doi") 
function(query, type=c("mendeley", "arxiv", "doi", "isbn", "pmid", "scopus", "ssm"), key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/details", query))
{
   type = match.arg(type)
   args = list(consumer_key = key)
   if(type != "mendeley")
     args$type = as.character(type)

   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
