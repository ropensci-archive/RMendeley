library(ROAuth)
library(RJSONIO)
setwd('~/Github/ropensci/RMendeley_DEV/R')
load('~/Desktop/Coding/mendeley_cred.rdata')

# AUTHENTICATION
source('user_mendeley_auth.r')

# PERSONAL
source('user_profile.r') # yes_example
source('user_library.r') #yes_example
source('user_addContact.r') #yes_example
source('user_author_stats.r') #yes_example
source('user_pub_stats.r') # yes_example
source('user_tag_stats.r') #yes_example
source('user_contacts.r') #yes_example
source('user_authored_pubs.r') #yes_example

# FOLDERS
source('user_folders.r')# yes_example
source('user_folder_documents.r') #yes_example
source('user_create_folder.r') #yes_example
source('user_add_doc_folder.r')
source('user_delete_folder.r') #yes_example

# DOCUMENTS
source('user_create_document.r')
source('user_docinfo.r')
source('user_download_file.r')
source('user_upload_file.r')
# GROUPS

source('user_create_group.r') #yes_example
source('user_groups.r') # yes_example
source('user_group_people.r') # needs a limit # yes_example
source('user_group_doc_details.r') #yes_example
source('user_group_documents.r') #yes_example
source('user_delete_group.r')
