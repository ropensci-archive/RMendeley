#' RMendeley - A programmatic interface to the Web Service methods provided by the Mendeley open science
#'
#' This is version 1.0.0 of package RMendeley. User specific API methods require obtaining access keys from Mendeley.com. To do so, first sign up at the Mendeley \href{http://apidocs.mendeley.com/}{developer site} and obtain Mendeley API keys. Ideally you should store these keys in your \code{.rprofile} but you may also specify them inline when authenticating with \code{\link{mendeley_auth}}.
#'
#' To save your cosumer key/secret combo in your \code{.rprofile}, add the following lines:
#'
#' \code{options(MendeleyKey = "YOUR_CONSUMER_KEY")}
#'
#' \code{options(MendeleyPrivateKey = "YOUR_PRIVATE_KEY")}
#'
#'
#' Most functions now require users to authenticate first using \code{\link{mendeley_auth}}. Once you had approved \code{RMendeley} on the Mendeley website, return to the R console and paste the PIN to complete authentication. You may save this \code{MendeleyCredential} object for future use and not repeat the authentication process for each session.
#'
#' \strong{Profile methods}
#' \itemize{
#' \item \code{\link{contacts}}
#' \item \code{\link{addContact}}
#' \item \code{\link{mendeley_profile}}
#' }
#'
#' \strong{Stats methods}
#' \itemize{
#' \item \code{\link{authorStats}}
#' \item \code{\link{tagStats}}
#' \item \code{\link{pubStats}}
#' }
#'
#' \strong{Document methods}
#' \itemize{
#' \item \code{\link{mendeley_library}}
#' \item \code{\link{authoredPubs}}
#' \item \code{\link{docInfo}}
#' \item \code{createDoc}  \emph{Not yet coded.}
#' \item \code{MendeleyUpload} \emph{Not yet coded.}
#' \item \code{MendeleyDownload}  \emph{Not yet coded.}
#' \item \code{\link{deleteDocument}}
#' }
#'
#'\strong{Group methods}
#' \itemize{
#' \item \code{\link{myGroups}}
#' \item \code{\link{groupPeople}}
#' \item \code{\link{groupDocs}}
#' \item \code{\link{groupDocInfo}}
#' \item \code{\link{createGroup}}
#' \item \code{\link{deleteGroup}}
#' \item \code{\link{leaveGroup}}
#' \item \code{\link{unfollowGroup}}
#' }
#
#' \strong{Folder methods}
#' \itemize{
#' \item \code{\link{Folders}}
#' \item \code{\link{folderDocs}}
#' \item \code{\link{addFolderDoc}}
#' \item  \code{\link{createFolder}}
#' \item \code{\link{deleteFolder}}
#' }
#'
#'\strong{Public methods}
#' \itemize{
#' \item \code{\link{authored}}
#' \item \code{\link{authors}}
#' \item \code{\link{categories}}
#' \item \code{\link{details}}
#' \item \code{\link{groups}}
#' \item \code{\link{papers}}
#' \item \code{\link{public_groups_details}}
#' \item \code{\link{public_groups_documents}}
#' \item \code{\link{msearch}}
#' \item \code{\link{subcategories}}
#' \item \code{\link{tagged}}
#' \item \code{\link{tags}}
#' }
#'
#' \strong{Useful links}
#' \itemize{
#' \item \href{http://mendeley.com/}{Mendeley}
#' \item \href{http://apidocs.mendeley.com/}{Full API documentation}
#' }
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
