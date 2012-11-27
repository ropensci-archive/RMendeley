# Installing RMendeley 1.00

Mendeley `1.00` requires `ROAuth 0.9.2` which is not yet available on CRAN. As soon as it becomes available on CRAN, we will update update `RMenedeley` as well. In the meantime, install `ROAUth` from github before installing this version:

```r
library(devtools)
install_github('ROAuth','duncantl')
install_github('RMendeley','ropensci')
```

## Tutorial

A full `RMendeley` tutorial is available on the [ropensci website](http://ropensci.org/tutorials/mendeley_tutorial.html).


# Public Methods API
> (see [public methods for more information](http://apidocs.mendeley.com/home/public-resources))

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

# User Specific Methods API
> (see [user specific methods for more information](http://apidocs.mendeley.com/home/user-specific-methods))

**Profiles Methods**

* `Contacts`
* `Add contact`
* `Profile info`

**Stats Methods**

* `Authors stats`
* `Tags stats`
* `Publications stats`

**Documents Methods**

* `Library`
* `Authored publications`
* `Documents details`
* `Create new document`
* `Upload file`
* `Download file`
* `Delete document`

**Groups Methods**

* `Groups`
* `Group people`
* `Group documents`
* `Group document details`
* `Create group`
* `Delete group`

**Folders Methods**

* `Folders`
* `Folder documents`
* `Add document to folder`
* `Create folder`
* `Delete folder`
* `Delete document from folder`
 
