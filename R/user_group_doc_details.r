#'This function will return all available information for a document within a group.
#'@param mendeley_cred  
#'@param  group_id  
#'@param  document_id  
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' user_group_doc_details(mendeley_cred,'1377653' ,'4402412575')
#'}
user_group_doc_details <- function(mendeley_cred, group_id = NULL, document_id = NULL)
{
	if(!is.mendeley.cred(mendeley_cred)) {
		stop("Your Mendeley credentials are incorrect. Please run mendeley_auth() again")
	}

if(is.null(group_id)) {
	stop("You did not enter a group ID.", call.= FALSE)
}

if(is.null(document_id)) {
	stop("You did not enter a document ID.", call.= FALSE)
}
    group_doc_detail <- paste("http://api.mendeley.com/oapi/library/groups/", group_id,"/", document_id, "/", sep = "")
	group_doc_det <- mendeley_cred$OAuthRequest(group_doc_detail, , "GET")
	group_doc_det <- fromJSON(group_doc_det)
	return(group_doc_det)
}
# Example Output
# > user_group_doc_details(mendeley_cred,'1377653' ,'4402412575')
# $authors
# $authors[[1]]
#  forename   surname 
#       "R" "Hilborn" 

# $authors[[2]]
#  forename   surname 
#     "E K" "Pikitch" 

# $authors[[3]]
#     forename      surname 
#        "M K" "McAllister" 


# $citation_key
# [1] "hilborn_bayesian_1994"

# $editors
# list()

# $issue
# [1] "1-2"

# $keywords
# list()

# $pages
# [1] "17-30"

# $published_in
# [1] "Fisheries Research"

# $source_type
# [1] "article"

# $title
# [1] "A Bayesian estimation and decision analysis for an age-structured model using biomass survey data"

# $translators
# list()

# $volume
# [1] "19"

# $year
# [1] "1994"

# $notes
# [1] "BIOSIS:PREV199497188145"

# $id
# [1] "4402412575"

# $type
# [1] "Journal Article"

# $tags
# list()

# $publication_outlet
# [1] "Fisheries Research"

# $identifiers
# list()

# $mendeley_url
# [1] "http://www.mendeley.com/c/4402412575/g/1377653/hilborn-1994-a-bayesian-estimation-and-decision-analysis-for-an-age-structured-model-using-biomass-survey-data/"

# $files
# $files[[1]]
#                                  file_hash                                  file_size 
# "894c4bf7f7c5a02342560445b0fcd854cb749b16"                                   "717277" 
#                             file_extension                                 date_added 
#                                      "pdf"                      "2011-05-25 18:54:39" 


# $modified
# [1] 1314745478

# $added
# [1] 1314743305

# $discipline
# [1] "Biological Sciences"

# $subdiscipline
# NULL