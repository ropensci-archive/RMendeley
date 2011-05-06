library(RCurl)

getForm(url, consumer_key = key, discipline_id = "statistics")
tt = getForm(sprintf("%s/%s", terms, "mendeley"), consumer_key = key)
library(RJSONIO)
search = fromJSON(tt)

