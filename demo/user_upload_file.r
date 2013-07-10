#'Allows authenticated users to attach files to a document in their library. [incomplete]
#'@param mc OAuth object of class MendeleyCredentials
#'@param  doc ...
#'@param  content ...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' MendeleyUpload(mc, ..)
#'}
MendeleyUpload  <- function(mc = NULL, doc, content, ..., curl = getCurlHandle()) {
#     if (!is(mc, 'MendeleyCredentials') ||  missing(mc))
#         stop('Invalid or missing Mendeley credentials. ?mendeley_auth for more information.', call.= FALSE)
# u = as(doc, 'URL')
#   if(!is(content, 'AsIs')) {
#      # read the content
#   }
#   sha = digest(content, 'sha1', serialize = FALSE)
#   input = RCurl:::uploadFunctionHandler(content, TRUE)
#   ans = OAuthRequest(mc, u, method = 'PUT',
#                            readfunction = input, infilesize = nchar(content),
#                            customHeader = c(oauth_body_hash = sha), ...
#                           )
#   ans == ''
# }
}
# # API: http://apidocs.mendeley.com/home/user-specific-methods/file-upload
