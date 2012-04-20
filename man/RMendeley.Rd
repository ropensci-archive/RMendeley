\docType{package}
\name{RMendeley}
\alias{package-RMendeley}
\alias{RMendeley}
\alias{RMendeley-package}
\title{RMendeley - A programmatic interface to the Web Service methods provided by the Mendeley open science}
\description{
  This is version 1.0.0 of package RMendeley. User specific
  API methods require obtaining access keys from
  Mendeley.com. To do so, first sign up at the Mendeley
  \href{http://apidocs.mendeley.com/}{developer site} and
  obtain Mendeley API keys. Ideally you should store these
  keys in your \code{.rprofile} but you may also specify
  them inline when authenticating with
  \code{\link{mendeley_auth}}.
}
\details{
  To save your cosumer key/secret combo in your
  \code{.rprofile}, add the following lines:

  \code{options(MendeleyKey = "YOUR_CONSUMER_KEY")}

  \code{options(MendeleyPrivateKey = "YOUR_PRIVATE_KEY")}

  Most functions now require users to authenticate first
  using \code{\link{mendeley_auth}}. Once you had approved
  \code{RMendeley} on the Mendeley website, return to the R
  console and paste the PIN to complete authentication. You
  may save this \code{MendeleyCredential} object for future
  use and not repeat the authentication process for each
  session.

  \strong{Personal functions} \itemize{ \item
  \code{\link{mendeley_library}} \item
  \code{\link{mendeley_profile}} \item
  \code{\link{pubStats}} \item \code{\link{tagStats}} \item
  \code{\link{authoredPubs}} \item
  \code{\link{authorStats}} \item \code{\link{contacts}}
  \item \code{\link{addContact}} }

  \strong{Folder functions} \itemize{ \item
  \code{\link{createFolder}} \item
  \code{\link{deleteFolder}} \item \code{\link{folderDocs}}
  \item \code{\link{Folders}} \item
  \code{\link{addFolderDoc}} \item
  \code{\link{getFolderID}} }

  \strong{Document functions} \itemize{ \item
  \code{\link{docInfo}} }

  \strong{Group functions} \itemize{ \item
  \code{\link{myGroups}} \item \code{\link{createGroup}}
  \item \code{\link{deleteGroup}} \item
  \code{\link{groupDocs}} \item \code{\link{groupDocInfo}}
  \item \code{\link{groupPeople}} \item
  \code{\link{leaveGroup}} \item
  \code{\link{unfollowGroup}} \item
  \code{\link{getGroupID}} } \strong{Public methods}
  \itemize{ \item \code{\link{authored}} \item
  \code{\link{authors}} \item \code{\link{categories}}
  \item \code{\link{details}} \item \code{\link{groups}}
  \item \code{\link{papers}} \item
  \code{\link{public_groups_details}} \item
  \code{\link{public_groups_documents}} \item
  \code{\link{msearch}} \item \code{\link{subcategories}}
  \item \code{\link{tagged}} \item \code{\link{tags}} }

  \strong{Useful links} \itemize{ \item
  \href{http://mendeley.com/}{Mendeley} \item
  \href{http://apidocs.mendeley.com/}{Full API
  documentation} }
}

