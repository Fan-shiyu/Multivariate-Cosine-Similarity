proj_3d <-
function(d1_PCs, d2_PCs){
    # here PCs are three dimensions
    if (!is.matrix(d1_PCs) | !is.matrix(d2_PCs))
        stop('PCs must be a matrix')
    if (ncol(d1_PCs)!=3 | ncol(d2_PCs)!=3)
        stop('PCs must be three dimensions')
    
    # p1: refer to data1 & loading1
    p1 <- c(proj_1d(d1_PCs[,1], d2_PCs[,1]), 
            proj_1d(d1_PCs[,2], d2_PCs[,1]), 
            proj_1d(d1_PCs[,3], d2_PCs[,1]))
    # p2: refer to data1 & loading2
    p2 <- c(proj_1d(d1_PCs[,1], d2_PCs[,2]), 
            proj_1d(d1_PCs[,2], d2_PCs[,2]), 
            proj_1d(d1_PCs[,3], d2_PCs[,2]))
    # p3: refer to data1 & loading3
    p3 <- c(proj_1d(d1_PCs[,1], d2_PCs[,3]), 
            proj_1d(d1_PCs[,2], d2_PCs[,3]), 
            proj_1d(d1_PCs[,3], d2_PCs[,3]))

    c <- rbind(p1, p2, p3)
    colnames(c) <- c('x','y','z')
    c
}
