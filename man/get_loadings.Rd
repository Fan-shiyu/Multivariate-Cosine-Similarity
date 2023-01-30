\name{get_loadings}
\alias{get_loadings}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
the number of PCs
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get_loadings(data, explain = 0.9, n_loadings = "auto", normalize = TRUE, scree_plot = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
}
  \item{explain}{
%%     ~~Describe \code{explain} here~~
}
  \item{n_loadings}{
%%     ~~Describe \code{n_loadings} here~~
}
  \item{normalize}{
%%     ~~Describe \code{normalize} here~~
}
  \item{scree_plot}{
%%     ~~Describe \code{scree_plot} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, explain = 0.9, n_loadings = "auto", normalize = TRUE, 
    scree_plot = FALSE) 
{
    if (!is.numeric(explain) | length(explain) != 1) 
        stop("argument \"explain\" must be numeric and has a length of 1")
    if (n_loadings != "auto" & (n_loadings < 1 | n_loadings > 
        3)) 
        stop("argument \"n_loadings\" must between 1 and 3")
    if (normalize) 
        data <- predict(caret::preProcess(data, method = c("range")), 
            data)
    pca <- princomp(data, cor = FALSE, scores = TRUE)
    loadings <- -as.numeric(pca[[2]])
    dim(loadings) <- c(ncol(data), ncol(data))
    vari_explain <- cumsum(pca[[1]]^2/sum(pca[[1]]^2))
    if (n_loadings == "auto") {
        if (vari_explain[1] >= explain) {
            loadings <- as.matrix(loadings[, 1])
        }
        else if (vari_explain[2] >= explain) {
            loadings <- loadings[, 1:2]
        }
        else loadings <- loadings[, 1:3]
    }
    if (n_loadings != "auto") 
        n_loadings <- round(n_loadings)
    if (n_loadings == 1) 
        loadings <- as.matrix(loadings[, 1])
    if (n_loadings == 2) 
        loadings <- loadings[, 1:2]
    if (n_loadings == 3) 
        loadings <- loadings[, 1:3]
    if (scree_plot) 
        scree_plot(vari_explain)
    return(loadings)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
