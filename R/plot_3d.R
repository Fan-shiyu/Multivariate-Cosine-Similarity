setGeneric('plot_3d', function(obj,...)  standardGeneric('plot_3d'))
setMethod('plot_3d', signature(obj='proj'),
           function(obj, pol.col=grey(0.7,0.1), edge.col='#6731f610',
                    bty='g', arrow.col='#6731f650', label=TRUE, anno=TRUE,
                    theta=10, phi=0, anno.col='#636363', label.col='#636363',
                    text.col='grey2', box.col=grey(0.3,0.8),
                    title='Projection in 3D',...){
           d <- proj_coords(obj)
           l <- list(c(1,2), c(1,3), c(2,3))
           q <- list(c(1,2,3), c(2,3,1), c(3,2,1))
           similarity <- function(proj) proj@similarity
           library(plot3D)
           scatter3D(d[1,1], d[1,2], d[1,3], cex = 0, bty=bty, colkey=FALSE,
                     main=title, theta=theta, phi=phi,
                     xlim=c(0,2.2), ylim=c(0,2.2), zlim=c(0,2.2),...)   
           text3D(0.5*d[,1], 0.5*d[,2], 0.5*d[,3], 
                  c(expression('p'[1]),expression('p'[2]),expression('p'[3])), 
                  col=text.col, add=TRUE,...)
               
           for (i in 1:3){
           polygon3D(c(0,d[l[[i]][1],1], d[l[[i]][1],1]+d[l[[i]][2],1], d[l[[i]][2],1]), 
                     c(0,d[l[[i]][1],2], d[l[[i]][1],2]+d[l[[i]][2],2], d[l[[i]][2],2]), 
                     c(0,d[l[[i]][1],3], d[l[[i]][1],3]+d[l[[i]][2],3], d[l[[i]][2],3]), 
                     col=pol.col, lty=0, add=TRUE,...)
           polygon3D(c(d[q[[i]][1],1], d[q[[i]][1],1]+d[q[[i]][2],1], sum(d[,1]), d[q[[i]][1],1]+d[q[[i]][3],1]), 
                     c(d[q[[i]][1],2], d[q[[i]][1],2]+d[q[[i]][2],2], sum(d[,2]), d[q[[i]][1],2]+d[q[[i]][3],2]), 
                     c(d[q[[i]][1],3], d[q[[i]][1],3]+d[q[[i]][2],3], sum(d[,3]), d[q[[i]][1],3]+d[q[[i]][3],3]), 
                     col=pol.col, lty=0, add=TRUE,...)
           arrows3D(0,0,0, d[i,1], d[i,2], d[i,3], col=arrow.col, add=TRUE, lwd=3, angle=50,...)
           lines3D(c(sum(d[,1]), d[l[[i]][1],1]+d[l[[i]][2],1]), 
                   c(sum(d[,2]), d[l[[i]][1],2]+d[l[[i]][2],2]), 
                   c(sum(d[,3]), d[l[[i]][1],3]+d[l[[i]][2],3]), 
                   add=TRUE, col=edge.col, lwd=1, lty=5,...)
          
           for (j in 1:2)
           lines3D(c(d[l[[i]][j],1], d[l[[i]][1],1]+d[l[[i]][2],1]), 
                   c(d[l[[i]][j],2], d[l[[i]][1],2]+d[l[[i]][2],2]), 
                   c(d[l[[i]][j],3], d[l[[i]][1],3]+d[l[[i]][2],3]), 
                   add=TRUE, col=edge.col, lwd=1, lty=5,...)
           }
               
           if (label){    
           legend(-0.03, 0.36, legend=c(paste0('    = ', round(lengths(obj)[1],3)),
                  paste0('    = ', round(lengths(obj)[2],3)),
                  paste0('    = ', round(lengths(obj)[3],3)),
                  paste0('V = ', round(similarity(obj),2)),
                  paste0('      = ', round(angles(obj)[1]),'°'),
                  paste0('      = ', round(angles(obj)[2]),'°'),
                  paste0('      = ', round(angles(obj)[3]),'°')),
                  box.col=box.col, lty=0, seg.len=0.2,
                  lwd=0, ncol=2, x.intersp=0.02, text.col=label.col,...)
           text3D(rep(1.77,3), rep(0,3), seq(1.83, l=3, by=0.1), 
                  c(expression('θ'[23]), expression('θ'[13]), expression('θ'[12])), 
                  col=label.col, add=TRUE,...)
           text3D(rep(1.28,3), rep(0,3), seq(1.86, l=3, by=0.1), 
                  c(expression('p'[3]), expression('p'[2]), expression('p'[1])), 
                  col=label.col, add=TRUE,...)
           }
           
           if (anno){    
           text3D(rep(1.14,7), rep(0,7), seq(0.04, l=7, by=0.09), 
                  c('V', expression('θ'[23]), expression('θ'[13]), 
                  expression('θ'[12]), expression('p'[3]), 
                  expression('p'[2]), expression('p'[1])), 
                  col=anno.col, add=TRUE,...)
           text3D(rep(1.2,7), rep(0,7), seq(0.04, l=7, by=0.09), 
                  c(': the cube root of the volume',
                  '   : the angle between p2 and p3',
                  '   : the angle between p1 and p3',
                  '   : the angle between p1 and p2',
                  ' : length of the projection of PC3', 
                  ' : length of the projection of PC2', 
                  ' : length of the projection of PC1'), 
                  col=anno.col, add=TRUE, cex=0.8,...)
}})
