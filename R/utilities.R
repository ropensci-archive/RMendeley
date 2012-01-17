# functions for manipulating the returns of mendeley calls

#' subset search results by matching author
#' 
#' get the ids of all the entries where the author's surname and forename 
#' match the given regular expressions
#' @param x the return of any search function, such as "authored" or "tagged"
#' @param surname the surname, will attempt partial matching
#' @param forename the author's first name, will attempt partial matching
#' @return a vector indicating where a (partial) match of both first and last
#' name has been successful
#' @examples \dontrun{
#' dakos <- authored("V Dakos")
#' m <- subset_by_author(dakos, "V", "Dakos")
#' unique(show_titles(dakos[m])) 
#' }
#' @export
subset_by_author <- function(x, surname, forename){
  sapply(x, function(y){
    if(!is.null(y$authors))
      matches <- sapply(y$authors, function(z)
        pmatch(forename, z["forename"], nomatch=0) & pmatch(surname, z["surname"])
      )
    else
      matches <- NA
    any(matches, na.rm=TRUE)
  })
}


#' show of authors on the paper
#'
#' @param x the list returned from a Mendeley public search method 
#' @return a vector of the authors in each of the publications
#' included in the returned list
#' @examples \dontrun{
#' me <- authored("Boettiger")
#' ## exclude others with same last name:
#' really_me <- subset_by_author(me, "Carl", "Boettiger")
#' ## show co-authors of the searched author, by manuscript
#' coauthors <- show_authors(me[really_me])
#' ## show unique co-authors 
#' unique(coauthors)
#' }
#' @export
show_authors <- function(x)
  sapply(x, function(y) try(y$authors))



#' show of titles of the returned papers
#'
#' @param x the list returned from a Mendeley public search method 
#' @return a vector of the titles in each of the publications
#' included in the returned list
#' @examples
#' \dontrun{
#' dakos <- authored("Dakos")
#' m <- subset_by_author(dakos, "V", "Dakos")
#' unique(show_titles(dakos[m])) 
#' }
#' @export
show_titles <- function(x)
  sapply(x, function(y) y$title)


#' show of titles of the returned papers
#'
#' @param x the list returned from a Mendeley public search method 
#' @return a vector of the years in each of the publications
#' included in the returned list
#' @examples
#' \dontrun{
#' dakos <- authored("Dakos")
#' m <- subset_by_author(dakos, "V", "Dakos")
#' histogram(show_years(dakos[m])) 
#' }
#' @export
show_years <- function(x)
  sapply(x, function(y) y$year)



#' name_match 
#' 
#' match the full name of an author to the list
#' @param authors a list of authors, (length two character strings)
#' @param target author (length 2 character string)
#' @return a list of the locations of a match
#' @details a helper function, mostly for Erdos example
#' @export
name_match <- function(authors, target){
    if(length(target)==2 & is.null(names(target)[1])){
      warning(paste("assuming", target[2], "is surname"))
      names(target) <- c("forename", "surname")
    }
    forename <- target["forename"]
    surname <- target["surname"]
    sapply(authors, function(z)
      pmatch(forename, z["forename"], nomatch=0) & pmatch(surname, z["surname"])
    )
}


#' coauth 
#'
#' Return the coauthors of an author
#' @param myname an author (length 2 character string)
#' @return the coauthors 
#' get the list of coauthors of the given name
#' @details a helper function, mostly for Erdos example
#' @export
coauth <- function(myname){
  if(length(myname)==2 & is.null(names(myname)[1])){
    warning(paste("assuming", myname[2], "is surname"))
    names(myname) <- c("forename", "surname")
  }
  user_firstname = myname["forename"]
  user_lastname = myname["surname"]
  m <- authored(paste(user_firstname, user_lastname))
  i <- subset_by_author(m, user_lastname, user_firstname)
  dat <- m[i] # just the good matches
  coauthors <- unique(unlist(show_authors(dat), recursive=FALSE))
}

#' erdos number
#'
#' A function to crawl the co-author tree looking for matches
#' @param myname name as character with two elements, forename and surname
#' @param target the name to match
#' @param cutoff stop trying after going this number of levels deep
#' @return the erdos number and the network of coauthors
#' The network is a list, where each element is successively
#' farther removed
#' @details This is really just an example function showing how
#' the RMendeley functions can leverage the power of scripted
#' codes and the R language to perform arbitrary & complicated
#' data manipulation. 
#' @examples \dontrun{
#' a <- erdos_number(myname=c(forename="Carl", surname="Boettiger"), 
#'  target=c(forename="Simon", surname="Levin"), cutoff=3)
#'}
#' @export
erdos_number <- function(myname, target="Erdos", cutoff=2){
  ## do careful matching on the target
  erdos_num <- 0
  stop <- FALSE
  coauthors <- coauth(myname)
  network <- vector("list", length=cutoff)
    network[[erdos_num+1]] <- coauthors # Should restructure to show actual network
  while(erdos_num < cutoff & !stop){
    erdos_num <- erdos_num+1
    coauthors <- unique(unlist(lapply(coauthors,coauth), recursive=FALSE))
    network[[erdos_num+1]] <- coauthors # Should restructure to show actual network
    stop <- any(name_match(coauthors, target), na.rm=TRUE) 
  }   
  if(erdos_num==cutoff)
    message(paste("Your Erdos number with", target, "is greater than", cutoff))
  else 
    message(paste("Your Erdos number with", target, "is", erdos_num))
  list(erdos=erdos_num, network=network)
}


