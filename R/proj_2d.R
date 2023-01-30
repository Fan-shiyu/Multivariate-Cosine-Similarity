proj_2d <-
function(d1_PCs, d2_PCs){
    # here PCs are two dimensions
    if (!is.matrix(d1_PCs) | !is.matrix(d2_PCs))
        stop('PCs must be a matrix')
    if (ncol(d1_PCs)!=2 | ncol(d2_PCs)!=2)
        stop('PCs must be two dimensions')
    
    # d2_pc1's projection to the plane of d1
    p1 <- c(proj_1d(d1_PCs[,1], d2_PCs[,1]), 
            proj_1d(d1_PCs[,2], d2_PCs[,1]))
    # d2_pc2's projection to the plane of d1
    p2 <- c(proj_1d(d1_PCs[,1], d2_PCs[,2]), 
            proj_1d(d1_PCs[,2], d2_PCs[,2]))
    
    c <- rbind(p1,p2)
    colnames(c) <- c('x','y')
    c
}
