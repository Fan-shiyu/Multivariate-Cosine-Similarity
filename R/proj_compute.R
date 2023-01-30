proj_compute <-
function(proj){
    # input is a 'proj' class
    if(!is.proj(proj)) stop("input must be the class 'proj'")
    if (proj@n_loadings!=1 & proj@n_loadings!=2 & proj@n_loadings!=3)
        stop('invalid dimensions')
    
    if (proj@n_loadings == 3){
        # 3d
        # coordinates
        proj@proj_coords <- proj_3d(proj@d1_PCs, proj@d2_PCs)
        # lengths
        p1 <- proj@proj_coords[1,]
        p2 <- proj@proj_coords[2,]
        p3 <- proj@proj_coords[3,]
        proj@lengths <- c(p1_l=sqrt(sum(p1^2)),
                          p2_l=sqrt(sum(p2^2)),
                          p3_l=sqrt(sum(p3^2)))
        # angles
        proj@angles <- c(p1_p2_deg=REdaS::rad2deg(Morpho::angle.calc(p1, p2)),
                         p1_p3_deg=REdaS::rad2deg(Morpho::angle.calc(p1, p3)),
                         p2_p3_deg=REdaS::rad2deg(Morpho::angle.calc(p2, p3)))
        # similarity
        proj@similarity <- abs(pracma::nthroot(det(t(proj_coords(proj))), 3))
    
    } else if (proj@n_loadings == 2){
        # 2d
        # coordinates
        proj@proj_coords <- proj_2d(proj@d1_PCs[,1:2], proj@d2_PCs[,1:2])
        # lengths
        p1 <- proj@proj_coords[1,]; p2 <- proj@proj_coords[2,]
        proj@lengths <- c(p1_l=sqrt(sum(p1^2)), p2_l=sqrt(sum(p2^2)))
        # angles
        proj@angles <- REdaS::rad2deg(Morpho::angle.calc(p1, p2))
        # similarity
        proj@similarity <- as.numeric(sqrt(proj@lengths[1] * 
                           proj@lengths[2] * sin(Morpho::angle.calc(p1, p2))))
    
    } else {
        # 1d
        # coordinates
        proj@proj_coords <- proj_1d(proj@d1_PCs, proj@d2_PCs)
        # lengths
        p <- as.numeric(proj@proj_coords)
        proj@lengths <- c(p=p)
        # similarity
        proj@similarity <- p
    }
    proj
}
