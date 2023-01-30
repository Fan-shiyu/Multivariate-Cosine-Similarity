scree_plot <-
function(d){
    # argument d is cumulative proportion of variance explained
    plot.new()
    plot.window(xlim=c(1, length(d)), ylim=c(min(d), max(d)))
    lines(d)
    points(d, pch=19)
    axis(1, at=1:length(d))
    axis(2, las=1)
    title(main='Scree Plot', xlab='Principal Component', 
    ylab='Cumulative Proportion of Variance Explained')
    box()
}
