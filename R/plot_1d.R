setGeneric('plot_1d', function(obj,...)  standardGeneric('plot_1d'))
setMethod('plot_1d', signature(obj='proj'),
          function(obj, arrow.col=c('#67a9cf','#ef8a62'), lwd=3.5, cex=1.2, 
                   label=TRUE, anno=TRUE, anno.col=grey(0.1,0.95),
                   text.col=NULL, label.col=NULL, box.col=grey(0.3,0.5),
                   title='Projection in 1D',...){
          if (length(arrow.col) != 2) stop("'arrow.col' must have a length of 2")
          plot.new()
          plot.window(xlim=c(0,1), ylim=c(-0.7, 0.76))
          len <- proj_coords(obj)
          pl <- 0.5*len; rl <- 0.5*(1+len)
          arrows(0,0,1,0, angle=30, col=arrow.col[1], lwd=lwd, code=2,...)
          arrows(0,0, len, 0, angle=30, col=arrow.col[2], lwd=lwd, code=2,...)
          text(c(pl,rl), 0.06, c('p','r'), cex=cex, col=text.col,...)

          if (label)
          legend(0, 0.76, legend=c(paste0('p = ', round(len,2)),  
                                   paste0('r = ', 1)), x.intersp=1.2,
          box.col=box.col, col=rev(arrow.col), lty=rep(1,2), 
          text.col=label.col, lwd=lwd, title='Length of vectors',...)
              
          if (anno)
          text(0.16, c(-0.57,-0.65), 
          c('p : the projected vector', 'r : the reference vector'), 
          col=anno.col,...)
          title(main=title,...)
          box(...)
})
