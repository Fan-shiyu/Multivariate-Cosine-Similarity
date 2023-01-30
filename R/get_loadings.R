get_loadings <-
function(data, explain=0.9, n_loadings='auto', 
                         normalize=TRUE, scree_plot=FALSE){
    # selecting the number of loadings
    # argument 'explain' is cumulative proportion of variance explained
    if (!is.numeric(explain) | length(explain)!=1)
        stop('argument "explain" must be numeric and has a length of 1')
    if (n_loadings!='auto' & (n_loadings<1 | n_loadings>3))
        stop('argument "n_loadings" must between 1 and 3')
    
    # normalization
    if (normalize)
    data <- predict(caret::preProcess(data, method=c("range")), data)
    # pca, using the spectral decomposition approach
    pca <- princomp(data, cor = FALSE, scores = TRUE)
    loadings <- -as.numeric(pca[[2]])
    # get loadings
    dim(loadings) <- c(ncol(data),ncol(data))
    # get the cumulative proportion of variance explained
    vari_explain <- cumsum(pca[[1]]^2 / sum(pca[[1]]^2))
    
    # selecting loadings
    if (n_loadings == 'auto'){
    if (vari_explain[1] >= explain){
    loadings <- as.matrix(loadings[,1])
    } else if (vari_explain[2] >= explain){
    loadings <- loadings[,1:2]
    } else loadings <- loadings[,1:3]
    }
    
    if (n_loadings != 'auto')  n_loadings <- round(n_loadings)
    if (n_loadings == 1)  loadings <- as.matrix(loadings[,1])
    if (n_loadings == 2)  loadings <- loadings[,1:2]
    if (n_loadings == 3)  loadings <- loadings[,1:3]
    if (scree_plot)  scree_plot(vari_explain)  
    return(loadings) 
}
