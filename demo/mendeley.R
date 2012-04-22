# Notes
# New lines in JSON being submitted can be problematic.
#    Use toJSON(obj, collapse = "")
#
# We will probably need followlocation to be specified in each curl operation/handle.
#   We can set this in each call or via options(RCurlOptions = list(followlocation = TRUE))
#   but have to be careful as this affects all uses of RCurl. Also have to set this
#
# There is a DELETE
#
#
# I encourage use of the S4 credential rather than the reference class.
#
#
#Create new document (user_create_document.r)
# • Upload file (user_upload_file.r)
# • Add document to folder (user_add_doc_folder.r)

# • Add Contacts (user_add_contacts.r)
#
# # • Download file (user_download_file.r)
#
# • Create folder (user_create_folder.r)
# • Delete folder (user_delete_folder.r)
# • Delete document from folder (user_delete_folder_doc.r)
#
# • Create group (user_create_group.r)
# • Delete group (user_delete_group.r) # Is there delete in addition to get and post?
#
#
# Test
# • Delete document (user_delete_document.r)
#

library(ROAuth)
library(RJSONIO)

if(FALSE) {
  #
  # To use this, source this file and then manually run this code
  # to get the credentials.
  # These functions should be merged into the R/ directory
  #
  #

cred <- OAuthFactory$new(consumerKey = getOption("MendeleyKey"),
                         consumerSecret = getOption("RMendeleySecret"),
                         requestURL = 'http://api.mendeley.com/oauth/request_token/',
                         accessURL = 'http://api.mendeley.com/oauth/access_token/',
                         authURL = 'http://api.mendeley.com/oauth/authorize/')

# OR

cred = oauth(consumerKey = getOption("MendeleyKey"),
             consumerSecret = getOption("RMendeleySecret"),
             requestURL = 'http://api.mendeley.com/oauth/request_token/',
             accessURL = 'http://api.mendeley.com/oauth/access_token/',
             authURL = 'http://api.mendeley.com/oauth/authorize/')

cred = cred$handshake(post = FALSE)

folders(cred)
f = createFolder(cred, "xyz")
deleteFolder(cred, f)


f = createFolder(cred, "temp")

allDocs = documents(cred)
 # or
allDocs = documentIds(cred)
i = getDocInfo(cred, allDocs[[2]])

addDocToFolder(cred, f, allDocs[[2]])
documents(cred, f)

deleteDocument(cred, allDocs[[2]], f)

deleteFolder(cred, f)
}


setClass("MendeleyID", contains = "character")
setClass("MendeleyGroupID", contains = "MendeleyID")
setClass("MendeleyFolderID", contains = "MendeleyID")

   # This documentID has no folder.
setClass("MendeleySimpleDocumentID", contains = "MendeleyID")
setClass("MendeleyDocumentID",
           representation(folder = "MendeleyFolderID"), contains = "MendeleyID")

setClass("URL", contains = "character")

setAs("MendeleyDocumentID", "URL",
       function(from)
         sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/", from@folder, as(from, "character")))

setAs("MendeleySimpleDocumentID", "URL",
       function(from)
         sprintf("http://api.mendeley.com/oapi/library/documents/%s/", as(from, "character")))

setAs("MendeleyFolderID", "URL",
       function(from)
         sprintf("http://api.mendeley.com/oapi/library/folders/%s/", as(from, "character")))

setAs("MendeleyGroupID", "URL",
       function(from)
         sprintf("http://api.mendeley.com/oapi/library/groups/%s/", as(from, "character")))


folders =
function(mc = NULL, ..., curl = getCurlHandle()) {
  val = OAuthRequest(mc, 'http://api.mendeley.com/oapi/library/folders/', ..., curl = curl)
  ans = fromJSON(val)
  names(ans) = sapply(ans, `[[`, "name")
  ans
}

deleteFolder =
function(mc = NULL, name, ..., curl = getCurlHandle())
{
  if(length(name) > 1)
     return(lapply(name, function(x) deleteFolder(cred, x, curl = curl)))

  if(!is(name, "AsIs") && !is(name, "MendeleyFolderID"))
     name = getFolderID(cred, name, curl = curl)

  u = sprintf('http://api.mendeley.com/oapi/library/folders/%s/', name)
  OAuthRequest(mc, u, method = "DELETE", ..., curl = curl) == ""
}



getFolderID =
  # helper function for mapping the folder name to an id.
function(mc = NULL, name, ..., curl = getCurlHandle())
{
  fl = folders(cred, curl = curl)
  i = match(name, names(fl))
  if(is.na(i))
    stop("Can't find folder")
  name = fl[[i]]$id
}

documentIds =
function(mc = NULL, page = NA, items = NA, ..., curl = getCurlHandle())
{
   params = character()
   if(!is.na(page))
      params["page"] = page
   if(!is.na(items))
      params["items"] = items

   val = OAuthRequest(mc, 'http://api.mendeley.com/oapi/library/')
   lapply(fromJSON(val)$document_ids,
            function(i)
               new("MendeleySimpleDocumentID", i))
 }

documents =
function(mc = NULL, folder = NULL, page = NA, items = NA, ..., curl = getCurlHandle())
{
  if(is.null(folder)) {
       return(documentIds(cred, ..., curl = curl))
    }

  if(!is(folder, "AsIs") && !is(folder, "MendeleyFolderID"))
     folder = getFolderID(cred, folder, curl = curl)

  u = sprintf("http://api.mendeley.com/oapi/library/folders/%s", as(folder, "character"))
  params = character()
  if(!is.na(page))
    params["page"] = page
  if(!is.na(items))
    params["items"] = as.character(as.integer(items))

  val = OAuthRequest(mc, u)
  ans = fromJSON(val)
  lapply(ans$document_ids,
           function(x)
              new("MendeleyDocumentID", x, folder = new("MendeleyFolderID", ans$folder_id)))
}



deleteDocument =
function(mc = NULL, name, ..., curl = getCurlHandle())
{
  if(length(name) > 1)
     return(lapply(name, function(x) deleteDocument(cred, x, curl = curl)))

   if(!is(name, "AsIs") && !is(name, "MendeleyFolderID"))
       name = getFolderID(cred, name, curl = curl)

   u = sprintf("http://api.mendeley.com/oapi/library/documents/%s/", name)
   OAuthRequest(mc, u, method = "DELETE", ..., curl = curl) == ""
}

deleteDocument =
  #
  #  This version works for a document or  a document within a folder .
  #
function(mc = NULL, doc, folder = NULL, ..., curl = getCurlHandle())
{
  if(!is.null(folder)) {
     u = sprintf("%s%s/", as(folder, "URL"), as(doc, "character"))
  } else
     u =  as(doc, "URL")
  OAuthRequest(mc, u, method = "DELETE", ..., curl = curl, followlocation = TRUE)
}

createFolder =
function(mc = NULL, name, ..., curl = getCurlHandle())
{
  if(length(name) > 1)
     return(lapply(name, function(x) createFolder(cred, x, curl = curl)))

  j = toJSON(list(name = name), collapse = "")  #!!! Note the collapse. Mendeley doesn't like the newlines.
  ans = OAuthRequest(mc, "http://api.mendeley.com/oapi/library/folders/",
                             list(folder = j) , "POST", ..., curl = curl)  # c(folder = j) also works.

  new("MendeleyFolderID", fromJSON(ans))
}


addDocToFolder =
function(mc = NULL, folder, doc, ..., curl = getCurlHandle())
{
  u = sprintf("%s%s/", as(folder, "URL"), as(doc, "character"))
  ans = OAuthRequest(mc, u, method = 'POST', ..., curl = curl)
  ans == ""
}


createGroup =
function(mc = NULL, name, type = "invite", ..., curl = getCurlHandle())
{
  content = toJSON(list(name = name, type = type), collapse = "")
  val = OAuthRequest(mc, "http://www.mendeley.com/oapi/library/groups/",
                           list(group = content), "POST")

  ans = fromJSON(val)
  new("MendeleyGroupID", as.character(ans))
}

groups =
function(mc = NULL, ..., curl = getCurlHandle())
{
  val = OAuthRequest(mc, "http://api.mendeley.com/oapi/library/groups/")
  ans = fromJSON(val)
  structure(lapply(ans, function(x) new("MendeleyGroupID", x$id)),
             names = sapply(ans, `[[`, "name"))
}

deleteGroup =
      #
      #  Want to allow for leave and unfollow
      #
function(mc = NULL, group, ..., curl = getCurlHandle())
{
  u =  as(group, "URL")

    # may want to get the header of the HTTP response and check the status is 204.
  OAuthRequest(mc, u, method = "DELETE", ..., curl = curl, followlocation = TRUE) == ""
}

createDoc =
function(mc = NULL, doc, ..., curl = getCurlHandle())
{
  jdoc = toJSON(doc, collapse = "")
  val = OAuthRequest(mc, 'http://api.mendeley.com/oapi/library/documents/',
                            list(document = jdoc), "POST", curl = curl)

  new("MendeleySimpleDocumentID", as.character(fromJSON(val)))
}

uploadFile =
function(mc = NULL, doc, content, ..., curl = getCurlHandle())
{
  u = as(doc, "URL")
  if(!is(content, "AsIs")) {
     # read the content

  }
  sha = digest(content, "sha1", serialize = FALSE)

  input = RCurl:::uploadFunctionHandler(content, TRUE)
  ans = OAuthRequest(mc, u, method = "PUT",
                           readfunction = input, infilesize = nchar(content),
                           customHeader = c(oauth_body_hash = sha), ...
                          )

  ans == ""
}

getDocInfo =
function(mc = NULL, doc, ..., curl = getCurlHandle())
{
   if(length(doc) > 1)
     return(lapply(doc, function(d) getDocInfo(cred, doc, ..., curl = curl)))

   u = as(doc, "URL")
   ans = OAuthRequest(mc, u, ..., curl = curl)
   fromJSON(ans)
}

downloadFile =
function(mc = NULL, doc, file = NA, binary = NA, ..., curl = getCurlHandle())
{

  if(is.na(file)) {
    info = getDocInfo(cred, doc, ..., curl = curl)
    id = sapply(info$files, `[[`, "file_hash")
    if(length(id) == 1)
      file = id
    else
      return(lapply(id, function(i) downloadFile(cred, doc, i, binary, ..., curl = curl)))
  }

  if(length(file) > 1)
      return(lapply(file, function(i) downloadFile(cred, doc, i, binary, ..., curl = curl)))


  if(nchar(file) != 40 || grepl("[^a-f0-9]", file)) {
      info = getDocInfo(cred, doc, ..., curl = curl)
      ext = sapply(info$files, `[[`, "file_extension")
      i = match(file, ext)
      if(is.na(i))
         stop("Cannot make sense of ", file, " as a file identifier for the document")
      file = info$files[[i]][["file_hash"]]
  }

  u = sprintf("%s/file/%s/", as(doc, "URL"), file)
  val = OAuthRequest(mc, u, ..., curl = curl)
  if(is.raw(val) && !is.na(binary) && !binary)
      rawToChar(val)
  else
      val

}


if(FALSE) {
 mg = createGroup(cred, "MyGroup")
 deleteGroup(cred, mg)

 doc = list(type = "Book", title = "MySQL Cookbook",
            authors = I("DuBois"))
 createDoc(cred, doc)


 doc = new("MendeleySimpleDocumentID", "4613380643")
 content = sprintf("This is simple content\n%s\n", Sys.time())
 uploadFile(cred, doc, content)
}
