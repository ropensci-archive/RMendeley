#' RMendeley - A programmatic interface to the Web Service methods provided by the Mendeley open science
#'
#' This is version 1.0.0 of package RMendeley. Prior to using this library, you must obtain Mendeley consumer and secret keys from the \href{http://apidocs.mendeley.com/}{developer site}.
#'
#' Ideally you should save both keys in your \code{.rprofile} as follows:
#'
#' #options(MendeleyKey = \"YOUR_CONSUMER_KEY\")
#' #options(MendeleyPrivateKey = \"YOUR_PRIVATE_KEY\")
#'
#'
#' Most functions now require users to authenticate first using \code{\link{mendeley_auth}}. Once you had approved \code{RMendeley} on the Mendeley website, return to the R console and paste the PIN to complete authentication. You may save those \code{MendeleyCredential} object for future use and not go through the authentication process again.
#'
#' \strong{Personal functions}
#' \enumerate{ \item \code{\link{mendeley_library}} \item \code{\link{mendeley_profile}} \item \code{\link{pubStats}} \item \code{\link{tagStats}} \item \code{\link{authoredPubs}} \item \code{\link{authorStats}} \item \code{\link{contacts}} \item \code{\link{addContact}} }
#'
#'
#' \strong{Folder functions}
#' \enumerate{ \item  \code{\link{createFolder}}  \item \code{\link{deleteFolder}} \item \code{\link{folderDocs}} \item \code{\link{Folders}} \item \code{\link{addFolderDoc}} \item \code{\link{getFolderID}} }
#'
#'
#' \strong{Document functions}
#' \enumerate{ \item \code{\link{docInfo}}}
#'
#'
#'\strong{Group functions}
#' \enumerate{ \item \code{\link{myGroups}} \item \code{\link{createGroup}} \item \code{\link{deleteGroup}} \item \code{\link{groupDocs}} \item \code{\link{groupDocInfo}} \item \code{\link{groupPeople}} \item \code{\link{leaveGroup}} \item \code{\link{unfollowGroup}} \item \code{\link{getGroupID}} }
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
