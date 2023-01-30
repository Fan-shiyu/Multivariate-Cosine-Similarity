setMethod(show, signature(object='proj'),
          function(object){
              if (object@similarity!=0)
                 print(list(similarity=object@similarity,
                            n_loadings=object@n_loadings,
                            proj_coords=object@proj_coords))
              else print("please run function 'proj_compute' to compute projection")
          })
