# 
erdos_number(myname=c(forename="Carl", surname="Boettiger")
target=c(forename="Simon", surname="Levin")
cutoff=2



erdos_num <- 0
stop <- FALSE
coauthors <- coauth(myname)
network <- vector("list", length=cutoff)
network[[erdos_num+1]] <- coauthors # Should restructure to show actual network


#  while(erdos_num < cutoff & !stop){
    erdos_num <- erdos_num+1
    coauthors <- unique(unlist(lapply(coauthors,coauth), recursive=FALSE))
    network[[erdos_num+1]] <- coauthors # Should restructure to show actual network
    stop <- any(name_match(coauthors, target), na.rm=TRUE) 
#  }   


