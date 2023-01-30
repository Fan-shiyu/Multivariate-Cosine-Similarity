setGeneric('pair_vioplot', function(obj,...)  standardGeneric('pair_vioplot'))
setMethod('pair_vioplot', signature(obj='proj'),
          function(obj, cols=3:4, box.lwd=1, box.col=grey(0.3,0.8),
                   legend.lty=1, legend.lwd=2, title='Violin Plot', 
                   legend.text=c('data1','data2'), legend=TRUE,...){
          d1_PCs <- function(proj) proj@d1_PCs
          d2_PCs <- function(proj) proj@d2_PCs
          h <- cbind(d1_PCs(obj), d2_PCs(obj))
          if (n_loadings(obj) == 3) h <- h[,c(1,4,2,5,3,6)]
          if (n_loadings(obj) == 2) h <- h[,c(1,3,2,4)]
          at <- c(1,2,4,5,7,8)[1:(2*n_loadings(obj))]
          ty <- round(seq(min(h), max(h), l=5), 2)
          ylim <- c(ylim=c(min(h), max(h)+0.3))
          vioplot::vioplot(h, col=cols, at=at, lwd=0.3, cex=0.3,
                           xlab='', ylab='', las=1,  axes=FALSE,
                           xaxt='n', yaxt='n', ylim=ylim,...)
          mtext(ty, side=2, line=0.5, at=ty, las=1,...)
          mtext(paste0('PC',1:n_loadings(obj)), side=1, line=0.3, at=seq(1.5, by=3, l=n_loadings(obj)),...)
          mtext(title, side=3, line=1, cex=1.2,...)
          if (legend)
          legend(0.5, ylim[2], legend.text, lty=legend.lty, col=cols, 
                 lwd=legend.lwd, box.lwd=box.lwd, box.col=box.col,...)
          box(...)
})
