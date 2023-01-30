setGeneric('pair_density_plot', function(obj,...)  standardGeneric('pair_density_plot'))
setMethod('pair_density_plot', signature(obj='proj'),
          function(obj, cols=c(2,'blue'), lwd=3, xlim=c(-1,1), ylim=c(-1,2),
                   legend=TRUE, box.lwd=0.6, box.col=grey(0.3,0.5),
                   legend.x=-1, legend.y=2, title='',...){
          if (length(cols) != 2) stop("'cols' must have a length of 2")
          if (!is.character(title)) stop("'title' must be character")
          d1_PCs <- function(proj) proj@d1_PCs
          d2_PCs <- function(proj) proj@d2_PCs
          opar <- par(mfrow = c(1,n_loadings(obj)), mar = rep(0, 4), oma = rep(4,4),...)
          for (i in 1:n_loadings(obj)){
          plot.new()
          plot.window(xlim=xlim, ylim=ylim,...)
          lines(density(d1_PCs(obj)[,i]), lwd=lwd, col=cols[1],...)
          lines(density(d2_PCs(obj)[,i]), lwd=lwd, col=cols[2],...)
          if (legend)
          legend(legend.x, legend.y, legend=c(paste0('d1 PC', i), paste0('d2 PC', i)), lwd=rep(lwd,2),
                 lty=c(1,1), col=cols, box.lwd=box.lwd, box.col=box.col,...)
          mtext(title, side=3, line=1.2, font=2, outer=TRUE, cex=1.2,...)
          box(...)
}})
