#' groupDocInfo -  Returns metadata for a document in a group.
#'
#'
#'@param mc OAuth object of class MendeleyCredentials
#'@param  group_id ...
#'@param  document_id ...
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' groupDocInfo(mc,1377653 ,4402412575)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
groupDocInfo <- function(mc = NULL, group_id = NULL, document_id = NULL,
    ..., curl = getCurlHandle()) {
if (!is(mc, "MendeleyCredentials"))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    if (is.null(group_id)) {
        stop("You did not enter a group ID.", call. = FALSE)
    }
    if (is.null(document_id)) {
        stop("You did not enter a document ID.", call. = FALSE)
    }
    group_doc_detail <- paste("http://api.mendeley.com/oapi/library/groups/", group_id,
        "/", document_id, "/", sep = "")
    group_doc_det <- suppressWarnings(OAuthRequest(mc, group_doc_detail, , "GET"))
    group_doc_det <- fromJSON(group_doc_det)
    return(group_doc_det)
}
# Example Output
# > user_group_doc_details(mc,'1377653' ,'4402412575')
# $authors
# $authors[[1]]
#  forename   surname
#       'R' 'Hilborn'
# $authors[[2]]
#  forename   surname
#     'E K' 'Pikitch'
# $authors[[3]]
#     forename      surname
#        'M K' 'McAllister'
# $citation_key
# [1] 'hilborn_bayesian_1994'
# $editors
# list()
# $issue
# [1] '1-2'
# $keywords
# list()
# $pages
# [1] '17-30'
# $published_in
# [1] 'Fisheries Research'
# $source_type
# [1] 'article'
# $title
# [1] 'A Bayesian estimation and decision analysis for an age-structured model using biomass survey data'
# $translators
# list()
# $volume
# [1] '19'
# $year
# [1] '1994'
# $notes
# [1] 'BIOSIS:PREV199497188145'
# $id
# [1] '4402412575'
# $type
# [1] 'Journal Article'
# $tags
# list()
# $publication_outlet
# [1] 'Fisheries Research'
# $identifiers
# list()
# $mendeley_url
# [1] 'http://www.mendeley.com/c/4402412575/g/1377653/hilborn-1994-a-bayesian-estimation-and-decision-analysis-for-an-age-structured-model-using-biomass-survey-data/'
# $files
# $files[[1]]
#                                  file_hash                                  file_size
# '894c4bf7f7c5a02342560445b0fcd854cb749b16'                                   '717277'
#                             file_extension                                 date_added
#                                      'pdf'                      '2011-05-25 18:54:39'
# $modified
# [1] 1314745478
# $added
# [1] 1314743305
# $discipline
# [1] 'Biological Sciences'
# $subdiscipline
# NULL

# error:


# Warning message:
# In RCurlIconv(str, from = "C99", to = encoding) :
#   C99 not supported iconv entries
# Calls: user_group_doc_details ... getURLContent -> <Anonymous> -> encode -> RCurlIconv
