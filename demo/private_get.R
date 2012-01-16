## Manipulation of private libraries through the Mendeley API is also 
## possible but requires OAuth authentication.  This demonstration shows
## how private information can be accessed from R.  
##
## This is work in progress, and will eventually be supported directly by the package functions


library(ROAuth)
library(RJSONIO)
cred <- OAuthFactory$new(consumerKey= getOption(MendeleyKey),
                        consumerSecret =getOption(MendeleySecret),
                        requestURL= 'http://api.mendeley.com/oauth/request_token/',
                        accessURL = 'http://api.mendeley.com/oauth/access_token/',
                        authURL = 'http://api.mendeley.com/oauth/authorize/')
#if using my OAuthInR
#                         curlHandle = getCurlHandle(verbose = TRUE))

cred$handshake( fun = "get")

lib = cred$OAuthRequest('http://api.mendeley.com/oapi/library/')
docs = fromJSON(I(lib))

docs$document_ids[[1]]

details = cred$OAuthRequest(sprintf('http://api.mendeley.com/oapi/library/documents/%s/', docs$document_ids[[1]]))


txt = cred$OAuthRequest('http://api.mendeley.com/oapi/library/folders/', method = "GET")

folders = fromJSON(txt)
txt = cred$OAuthRequest(sprintf('http://api.mendeley.com/oapi/library/folders/%s/', folders[[1]]$id))
fromJSON(txt)


