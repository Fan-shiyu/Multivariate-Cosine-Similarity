setClass('proj', slots=list(d1_PCs='matrix', 
                            d2_PCs='matrix',
                            n_loadings='numeric',
                            proj_coords='matrix',
                            lengths='numeric',
                            angles='numeric',
                            similarity='numeric'))
# creating a class 'proj'
# constructor functions for the class PCs
proj <-
function(d1_PCs, d2_PCs, n_loadings=min(ncol(d1_PCs), ncol(d2_PCs)), 
                 proj_coords=matrix(0, nr=n_loadings), 
                 lengths=numeric(n_loadings), 
                 angles=if (n_loadings==3) {numeric(3)} else (numeric(1)), 
                 similarity=numeric(1)){
    
    # identifying data types
    if (!is.matrix(d1_PCs) | !is.matrix(d2_PCs))  
        stop('principal components must be a matrix')
    if (!is.matrix(proj_coords))  stop('projected coordinates must be a matrix')
    if (!is.numeric(lengths)) stop('"lengths" must be numeric')
    if (!is.numeric(angles)) stop('"angles" must be numeric')
    if (!is.numeric(similarity)) stop('"similarity" must be numeric')
    
    # identifying dimensions
    if (ncol(d1_PCs)<1 | ncol(d1_PCs)>3) 
        stop('the number of PCs must between 1 and 3')
    if (ncol(d2_PCs)<1 | ncol(d2_PCs)>3) 
        stop('the number of PCs must between 1 and 3')
    if (nrow(proj_coords) != n_loadings) 
        stop('unmatched length of slot "proj_coords"')
    if (length(lengths) != n_loadings) 
        stop('unmatched length of slot "lengths"')
    if (n_loadings==2 & length(angles)!=1) stop('the number of angle must be 1')
    if (n_loadings==3 & length(angles)!=3) stop('the number of angles must be 3')
    if (length(similarity) != 1) stop('"similarity" must be one number')
        
    d1_PCs <- as.matrix(d1_PCs[,1:n_loadings])
    d2_PCs <- as.matrix(d2_PCs[,1:n_loadings])
    new('proj', d1_PCs=d1_PCs, d2_PCs=d2_PCs,
                n_loadings=n_loadings, proj_coords=proj_coords, 
                lengths=lengths, angles=angles, similarity=similarity)
}
