setGeneric('pair_boxplot', function(obj,...)  standardGeneric('pair_boxplot'))
setMethod('pair_boxplot', signature(obj='proj'),
          function(obj, cols=3:4, box.lwd=1, box.col=grey(0.3,0.8),
                   legend.lty=1, legend.lwd=2, title='Box Plot', 
                   legend.text=c('data1','data2'), points=TRUE, point.col=1,
                   point.cex=0.8, point.pch=19, legend=TRUE,...){
          d1_PCs <- function(proj) proj@d1_PCs
          d2_PCs <- function(proj) proj@d2_PCs
          h <- cbind(d1_PCs(obj), d2_PCs(obj))
          n <- nrow(h)
          if (n_loadings(obj) == 3) h <- h[,c(1,4,2,5,3,6)]
          if (n_loadings(obj) == 2) h <- h[,c(1,3,2,4)]
          at <- c(1,2,4,5,7,8)[1:(2*n_loadings(obj))]
          ty <- round(seq(min(h), max(h), l=5), 2)
          ylim <- c(ylim=c(min(h), max(h)+0.3))
          boxplot(h, pch=20, cex=0.5, col=cols, axes=FALSE, 
                  xlab='', ylab='', at=at, ylim=ylim,...)
          if (points)
          for (i in at)
          points(jitter(rep(i, n), amount=0.3), h[,1], pch=point.pch, cex=point.cex, 
                 col=point.col)
          
          mtext(ty, side=2, line=0.5, at=ty, las=1,...)
          mtext(paste0('PC',1:n_loadings(obj)), side=1, line=0.3, at=seq(1.5, by=3, l=n_loadings(obj)),...)
          mtext(title, side=3, line=1, cex=1.2,...)
          if (legend)
          legend(0.5, ylim[2], legend.text, lty=legend.lty, col=cols, 
                 lwd=legend.lwd, box.lwd=box.lwd, box.col=box.col,...)
          box(...)
})
