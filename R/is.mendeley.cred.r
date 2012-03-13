is.mendeley.cred <- function(mendeley_cred, response = TRUE) {
    if (missing(mendeley_cred)) {
        response <- FALSE
    }
    if (response) {

       response <- ifelse(as.character(substitute(mendeley_cred)) %in% ls( envir = .GlobalEnv),TRUE,FALSE )
   }
    if (response) {
        response <- ifelse(class(mendeley_cred) != "OAuth", FALSE, TRUE)
    }
    if (response) {
        response <- ifelse(grep("mendeley", mendeley_cred$requestURL) != 1, FALSE,
            TRUE)
    }
    return(response)
}