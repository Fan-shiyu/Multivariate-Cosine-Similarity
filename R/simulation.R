simulation <-
function(data, mean = 0, sd, seed=2023){
# here is a function to get two similar data sets
    set.seed(seed)
    apply(data, 2, function(x) x + rnorm(nrow(data), mean=mean, sd=sd))
}
