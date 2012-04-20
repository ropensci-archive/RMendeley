#' User download file (not working because docInfo does not return file hash)
#'
#'@param mc OAuth object of class MendeleyCredentials
#' @param  doc ...
#' @param  file File to download
#' @param  binary logical. Set TRUE for binary files.
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#' @export
#' @examples \dontrun{
#' MendeleyDownload(mc, ....)
#'}
MendeleyDownload <- function(mc = NULL, doc, file = NA, binary = NA,
    ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)

    if (is.na(file)) {
        info <- docInfo(mc, doc, ..., curl = curl)
        id <- sapply(info$files, `[[`, "file_hash")
        if (length(id) == 1)
            file <- id else return(lapply(id, function(i) downloadFile(mc, doc, i, binary, ...,
            curl = curl)))
    }
    if (length(file) > 1)
        return(lapply(file, function(i) downloadFile(mc, doc, i, binary, ..., curl = curl)))
    if (nchar(file) != 40 || grepl("[^a-f0-9]", file)) {
        info <- getDocInfo(mc, doc, ..., curl = curl)
        ext <- sapply(info$files, `[[`, "file_extension")
        i <- match(file, ext)
        if (is.na(i))
            stop("Cannot make sense of ", file, " as a file identifier for the document")
        file <- info$files[[i]][["file_hash"]]
    }
    u <- sprintf("%s/file/%s/", as(doc, "URL"), file)
    val <- OAuthRequest(mc, u, ..., curl = curl)
    if (is.raw(val) && !is.na(binary) && !binary)
        rawToChar(val) else val
}
if (FALSE) {
    mg <- user_create_group(mc, "MyGroup")
    user_delete_group(mc, mg)
    doc <- list(type = "Book", title = "MySQL Cookbook", authors = I("DuBois"))
    user_create_document(mc, doc)
    doc <- new("MendeleySimpleDocumentID", "4613380643")
    content <- sprintf("This is simple content\n%s\n", Sys.time())
    uploadFile(mc, doc, content)
}
# API: http://apidocs.mendeley.com/home/user-specific-methods/download-file
