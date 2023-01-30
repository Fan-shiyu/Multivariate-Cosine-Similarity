setGeneric('plot_2d', function(obj,...)  standardGeneric('plot_2d'))
setMethod('plot_2d', signature(obj='proj'), 
          function(obj, arrow.col='#e41a1c98', pol.col='#e41a1c20',
                   label=TRUE, anno=TRUE, anno.col=grey(0.1,0.9), 
                   box.col=grey(0.3,0.5),label.col=grey(0.05,0.95),
                   text.col=NULL, title='Projection in 2D',...){
          p1 <- proj_coords(obj)[1,]
          p2 <- proj_coords(obj)[2,]
          p1x <- 0.5*p1[1]; p1y <- 0.5*p1[2]-0.06
          p2x <- 0.5*p2[1]-0.06; p2y <- 0.5*p2[2]
              
          plot.new()
          plot.window(xlim=c(-1,1.2), ylim=c(-1,1.2))
          arrows(0,0,p1[1],p1[2], angle=30, col=arrow.col, lwd=4, code=2,...)
          arrows(0,0,p2[1],p2[2], angle=30, col=arrow.col, lwd=4, code=2,...)
          polygon(c(0,p1[1],p1[1]+p2[1],p2[1]), 
                  c(0,p1[2],p1[2]+p2[2],p2[2]), col=pol.col, lty=0,...)
          plotrix::draw.arc(0, 0, radius=0.06, deg1=0, col=text.col, 
                  deg2=if(p2[2]>=0) {angles(obj)} else(-angles(obj)+6),...)
          text((p1[1]+p2[1])*0.1, (p1[2]+p2[2])*0.1, 'θ', 
               cex=1.3, col=text.col,...)
          text(p1x, p1y, 'P1', cex=1.2, col=text.col,...)
          text(p2x, p2y, 'P2', cex=1.2, col=text.col,...)
                            
          if (label)
          legend(-1, 1.2, 
          legend=c(paste0('P1 = ', round(lengths(obj)[1],2)),  
                  paste0('P2 = ', round(lengths(obj)[2],2)),
                  paste0('θ = ', round(angles(obj)), '°'),
                  paste0('S = ', round(similarity(obj),2))), 
          x.intersp=0.6, ncol=2, box.col=box.col, text.col=label.col,...)         

          if (anno)                  
          text(c(-0.46,-0.46,-0.47,-0.51), seq(-0.73, l=4, by=-0.08),
               c('P1 : length of the projection of PC1', 
                 'P2 : length of the projection of PC2',
                 'θ : the angle between p1 and p2',
                 'S : the square root of the area'), col=anno.col,...)
          title(main=title,...) 
          box(...)
})
