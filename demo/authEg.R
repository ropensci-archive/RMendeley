## Manipulation of private libraries through the Mendeley API is also 
## possible but requires OAuth authentication.  This demonstration shows
## how private information can be accessed from R.  
##
## This is work in progress, and will eventually be supported directly by the package functions

library(ROAuth)
library(RJSONIO)

cred <- OAuthFactory$new(consumerKey = getOption(MendeleyKey),
                         consumerSecret = getOption(RMendeleySecret),
                         requestURL = 'http://api.mendeley.com/oauth/request_token/',
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

#XXX When converting to JSON, we currently need collapse = "" or we end up with a signature
# error.

doc = list(type = "Book",
           title = "Document creation test",
           year = 2008L)
jdoc = toJSON(doc, collapse = "")

newDoc = cred$OAuthRequest('http://api.mendeley.com/oapi/library/documents/', c(document = jdoc), "POST")


f = toJSON(list(name = "Test folder"), collapse = "")
cred$OAuthRequest('http://api.mendeley.com/oapi/library/folders/', c(folder = f), "POST")


################################

# Delete a folder

u = sprintf('http://api.mendeley.com/oapi/library/folders/%s/', folders[[1]]$id)
cred$OAuthRequest(u, method = "DELETE", verbose = TRUE)


########
# Upload a file via a PUT

lib = cred$OAuthRequest('http://api.mendeley.com/oapi/library/')
docs = fromJSON(I(lib))
u = sprintf('http://www.mendeley.com/oapi/library/documents/%s/', docs$document_ids[[1]])
f = CFILE("foo.pdf")
cred$OAuthRequest(u, readdata = f@ref, infilesize = file.info("foo.pdf")[1, "size"], method = "PUT")
