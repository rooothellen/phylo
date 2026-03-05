
library(ape)

#' Reroots a phylogeny based on a specified tip
#'
#' @param tree Phylogeny to be rerooted
#' @param tip The species to become the root
#' @return an object of class phylo that is now rerooted
reroot.tree <- function(tree, tip){
    p<-root(tree,outgroup=tip,resolve.root=TRUE)
    bb <- which(p$tip.label==tip)
    
    ee <- p$edge.length[which(p$edge[,2]==bb)]
    p$edge.length[which(p$edge[,2]==bb)] <- 0
    cc <- p$edge[which(p$edge[,2]==bb),1]
    dd <- setdiff(p$edge[which(p$edge[,1]==cc),2],bb)
    
    p$edge.length[which(p$edge[,2]==dd)]<-p$edge.length[which(p$edge[,2]==dd)]+(ee/2)
    p$edge.length[which(p$edge[,2]==bb)] <- (ee/2)
    p <- ladderize(p)
    return(p)
}
