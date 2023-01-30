setGeneric('proj_plot', function(obj,...)  standardGeneric('proj_plot'))
setMethod('proj_plot', signature(obj='proj'),
          function(obj,...){
          if (n_loadings(obj) == 3) plot_3d(obj,...)
          if (n_loadings(obj) == 2) plot_2d(obj,...)
          if (n_loadings(obj) == 1) plot_1d(obj,...)
})
