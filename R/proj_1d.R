proj_1d <-
function(d1_PC1, d2_PC1){
    # here is a function to compute the coordinate of projected vector
    # input are PCs from two datasets, here d1_PC1 is reference
    c <- matrix(cos(Morpho::angle.calc(d1_PC1, d2_PC1)))
    colnames(c) <- 'x'
    c
}
