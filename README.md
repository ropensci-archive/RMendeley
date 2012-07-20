**Important.**

`Mendeley 1.00` requires `ROAuth 0.9.2` which is not yet available on CRAN. As soon as it is updated, we will push update `RMenedeley` as well. In the meantime, install `ROAUth` from github before installing this version:

```r
library(devtools)
install_github('ROAuth','duncantl')
```


# Public Methods API
> (see [public methods for more information](http://apidocs.mendeley.com/home/public-resources ))

**Statistics methods (from Mendeley Server)**

 * `authors` -- top authors (overall or by subject, trending)
 * `papers` -- all time top papers (overall or by subject, trending)
 * `publications` -- top journals
 * `tags` -- most popular tags in week-long periods

**Search methods**

 * `msearch`-- all papers matching the search query
 * `authored` -- all papers with given author
 * `related` -- related papers
 * `tagged` -- all papers with the tag
 * `Categories` -- a function to look up categories and their reference numbers
 * `subcategories` - a function to look up subcategories and their reference numbers
 * `Details` -- more details such as authors, publication outlet, year, abstract, PubMed ID if available, etc. Also returns # readers, top 3 discipline stats, top 3 country stats, and top 3 education status stats.


**Public Group methods**

 * `Public groups overview`
 * `Public groups details`
 * `Public groups documents`
 * `Public groups people`


# User Specific Methods
 >  New functions coming to the next version of Mendeley. (see [user specific methods for more information](http://apidocs.mendeley.com/home/user-specific-methods))

 **Stats Methods**

* `Authors stats` (completed)
* `Tags stats` (completed)
* `Publications stats` (completed)

**Documents Methods**

* `Library` (completed)
* `Authored publications` (compelted)
* `Documents details` (completed)
* `Create new document`
* `Upload file`
* `Download file`
* `Delete document`

**Groups Methods**

* `Groups` (completed)
* `Group people` (completed)
* `Group documents` (completed)
* `Group document details` (completed)
* `Create group`
* `Delete group`

**Folders Methods**

* `Folders`(completed)
* `Folder documents` (completed)
* `Add document to folder`
* `Create folder`
* `Delete folder`
* `Delete document from folder`


**Profiles Methods**

* `Contacts` (completed)
* `Add contact`
* `Profile info`(completed)


