setGeneric('pair_correlation_plot', function(obj,...)  standardGeneric('pair_correlation_plot'))
setMethod('pair_correlation_plot', signature(obj='proj'),
          function(obj, legend=TRUE, point.col=1, line.col='blue',
                   box.lwd=0.6, box.col=grey(0.3,0.5), 
                   legend.x=-0.6, legend.y=0.72, title='',...){
          if (!is.character(title)) stop("'title' must be character")
          library(DescTools)
          d1_PCs <- function(proj) proj@d1_PCs
          d2_PCs <- function(proj) proj@d2_PCs
          opar <- par(mfrow = c(1,n_loadings(obj)), mar = rep(0, 4), oma = rep(4,4),...)
          for (i in 1:n_loadings(obj)){
          f <- as.data.frame(cbind(d1_PCs(obj)[,i], d2_PCs(obj)[,i]))
          plot(V1~V2, f, xlab='', ylab='', pch=19, cex=0.8, las=1, col=point.col,
               xaxt='n', yaxt='n', xlim=c(-0.6,0.6), ylim=c(-0.6,0.7),...)
          lines(lm(V1~V2, f), lwd=3, col=line.col,...)
          if (legend)
          legend(legend.x, legend.y, legend=c('d1 PC1 & d2 PC1    ', 
                 paste0('cor = ', round(cor.test(f[,1], f[,2])[[4]], 2))),
                 box.lwd=box.lwd, box.col=box.col,...)
          mtext(title, side=3, line=1.2, font=2, outer=TRUE, cex=1.2,...)
}})
