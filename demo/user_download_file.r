#' User download file (not working because docInfo does not return file hash)
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#' @param  doc <what param does>
#' @param  file   <what param does>
#' @param  binary logical. Set TRUE for binary files.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#' @export
#' @examples \dontrun{
#' user_download_file(mendeley_cred, ....)
#'}
user_download_file <- function(mendeley_cred = NULL, doc, file = NA, binary = NA,
    ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

    if (is.na(file)) {
        info <- docInfo(mendeley_cred, doc, ..., curl = curl)
        id <- sapply(info$files, `[[`, "file_hash")
        if (length(id) == 1)
            file <- id else return(lapply(id, function(i) downloadFile(mendeley_cred, doc, i, binary, ...,
            curl = curl)))
    }
    if (length(file) > 1)
        return(lapply(file, function(i) downloadFile(mendeley_cred, doc, i, binary, ..., curl = curl)))
    if (nchar(file) != 40 || grepl("[^a-f0-9]", file)) {
        info <- getDocInfo(mendeley_cred, doc, ..., curl = curl)
        ext <- sapply(info$files, `[[`, "file_extension")
        i <- match(file, ext)
        if (is.na(i))
            stop("Cannot make sense of ", file, " as a file identifier for the document")
        file <- info$files[[i]][["file_hash"]]
    }
    u <- sprintf("%s/file/%s/", as(doc, "URL"), file)
    val <- OAuthRequest(mendeley_cred, u, ..., curl = curl)
    if (is.raw(val) && !is.na(binary) && !binary)
        rawToChar(val) else val
}
if (FALSE) {
    mg <- user_create_group(mendeley_cred, "MyGroup")
    user_delete_group(mendeley_cred, mg)
    doc <- list(type = "Book", title = "MySQL Cookbook", authors = I("DuBois"))
    user_create_document(mendeley_cred, doc)
    doc <- new("MendeleySimpleDocumentID", "4613380643")
    content <- sprintf("This is simple content\n%s\n", Sys.time())
    uploadFile(mendeley_cred, doc, content)
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/download-file
