# functions for manipulating the returns of mendeley calls

# Change matches to return matches[[1]].  Then
# subset_by functions give a list that can be used to subset the results

#' get the ids of all the entries where the author's surname and forename match the given regular expressions
#'
#' dakos <- authored("Dakos")
#' subset_by_author(dakos, "V", "Dakos")
#' 
subset_by_author <- function(x, surname, forename){
  sapply(x[[1]], function(y){
    matches <- sapply(y$authors, function(z)
      pmatch(forename, z["forename"], nomatch=0) & pmatch(surname, z["surname"])
    )
    any(matches, na.rm=TRUE)
  })
}

# just give me a list of all the authors, where full name is 
extract_authors <- function(x)


# count number of authors on the paper
#' @param x the list returned from a Mendeley public search method 
#' @returns a vector of the number of authors in each of the publications included in the returned list
#' @export
count_authors <- function(x) 
  sapply(x[[1]], function(y) length(y$authors))


titles <- function(x)
  sapply(x[[1]], function(y) y$title)

years <- function(x)
  sapply(x[[1]], function(y) y$year)



