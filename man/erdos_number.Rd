\name{erdos_number}
\alias{erdos_number}
\title{erdos number}
\usage{
  erdos_number(myname, target = "Erdos", cutoff = 2)
}
\arguments{
  \item{myname}{name as character with two elements,
  forename and surname}

  \item{target}{the name to match}

  \item{cutoff}{stop trying after going this number of
  levels deep}
}
\value{
  the erdos number and the network of coauthors The network
  is a list, where each element is successively farther
  removed
}
\description{
  A function to crawl the co-author tree looking for
  matches
}
\details{
  This is really just an example function showing how the
  RMendeley functions can leverage the power of scripted
  codes and the R language to perform arbitrary &
  complicated data manipulation.
}
\examples{
\dontrun{
a <- erdos_number(myname=c(forename="Carl", surname="Boettiger"),
 target=c(forename="Simon", surname="Levin"), cutoff=3)
}
}

