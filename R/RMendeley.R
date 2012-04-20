#' RMendeley - Programmatic interface to the Mendeley Web
#'
#' This is version 1.0.0 of package RMendeley.
#'
#' \strong{Personal functions}
#' \enumerate{ \item \link{mendeley_library} \item \link{mendeley_profile} \item \link{pubStats} \item \link{tagStats} \item \link{authoredPubs} \item \link{authorStats} \item \link{contacts} \item \link{addContact} }
#'
#'
#' \strong{Folder functions}
#' \enumerate{ \item  \link{createFolder}  \item \link{deleteFolder} \item \link{folderDocs} \item \link{Folders} \item \link{addFolderDoc} \item \link{getFolderID} }
#'
#'
#' \strong{Document functions}
#' \enumerate{ \item \link{docInfo} }
#'
#'
#'\strong{Group functions}
#' \enumerate{ \item \link{myGroups} \item \link{createGroup} \item \link{deleteGroup} \item \link{groupDocs} \item \link{groupDocInfo} \item \link{groupPeople} \item \link{leaveGroup} \item \link{unfollowGroup} \item \link{getGroupID} }
#'
#'
#' \strong{Useful links}
#' \enumerate{ \item \href{http://mendeley.com/}{Mendeley} \item \href{http://apidocs.mendeley.com/}{Full API documentation}}



#' @name RMendeley
#' @docType package
#' @aliases RMendeley package-RMendeley
NULL


#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleyCredentials", contains = "OAuthCredentials")
#' An S4 class that stores MendeleyID
#' @name MendeleyID-class
#' @rdname MendeleyID-class
#' @exportClass MendeleyID
setClass("MendeleyID", contains = "character")
#' An S4 class that stores MendeleyGroupID
#' @name MendeleyGroupID-class
#' @rdname MendeleyGroupID-class
#' @exportClass MendeleyGroupID
setClass("MendeleyGroupID", contains = "MendeleyID")
#' An S4 class that stores MendeleyFolderID
#' @name MendeleyFolderID-class
#' @rdname MendeleyFolderID-class
#' @exportClass MendeleyFolderID
setClass("MendeleyFolderID", contains = "MendeleyID")
# This documentID has no folder.
#' An S4 class that stores Mendeley credentials
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleySimpleDocumentID", contains = "MendeleyID")
#' An S4 class that stores MendeleyID
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("MendeleyDocumentID", representation(folder = "MendeleyFolderID"),
    contains = "MendeleyID")
#' An S4 class that stores MendeleyDocumentID
#' @name MendeleyCredentials-class
#' @rdname MendeleyCredentials-class
#' @exportClass MendeleyCredentials
setClass("URL", contains = "character")
#' An S4 class that stores Mendeley credentials
#' @name MendeleyDocumentID-class
#' @rdname MendeleyDocumentID-class
#' @exportClass MendeleyDocumentID
setAs("MendeleyDocumentID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/folders/%s/%s/",
    from@folder, as(from, "character")))
#' An S4 class that stores Mendeley credentials
#' @name MendeleySimpleDocumentID-class
#' @rdname MendeleySimpleDocumentID-class
#' @exportClass MendeleySimpleDocumentID
setAs("MendeleySimpleDocumentID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/documents/%s/",
    as(from, "character")))
#' An S4 class that stores MendeleyFolderId
#' @name MendeleyFolderID-class
#' @rdname MendeleyFolderID-class
#' @exportClass MendeleyFolderID
setAs("MendeleyFolderID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/folders/%s/",
    as(from, "character")))
#' An S4 class that stores MendeleyGroupID
#' @name MendeleyGroupID-class
#' @rdname MendeleyGroupID-class
#' @exportClass MendeleyGroupID
setAs("MendeleyGroupID", "URL", function(from) sprintf("http://api.mendeley.com/oapi/library/groups/%s/",
    as(from, "character")))
