#'Allows authenticated users to attach files to a document in their library. [incomplete]
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param  doc ...
#'@param  content ...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' functions is not complete
#'}
user_upload_file  <- function(mendeley_cred = NULL, doc, content, ..., curl = getCurlHandle()) {
#     if (!is(mendeley_cred, 'MendeleyCredentials') ||  missing(mendeley_cred))
#         stop('Invalid or missing Mendeley credentials. ?mendeley_auth for more information.', call.= FALSE)
# u = as(doc, 'URL')
#   if(!is(content, 'AsIs')) {
#      # read the content
#   }
#   sha = digest(content, 'sha1', serialize = FALSE)
#   input = RCurl:::uploadFunctionHandler(content, TRUE)
#   ans = OAuthRequest(mendeley_cred, u, method = 'PUT',
#                            readfunction = input, infilesize = nchar(content),
#                            customHeader = c(oauth_body_hash = sha), ...
#                           )
#   ans == ''
# }
}
# # API: http://apidocs.mendeley.com/home/user-specific-methods/file-upload
