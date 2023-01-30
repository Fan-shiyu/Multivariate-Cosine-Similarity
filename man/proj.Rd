\name{proj}
\alias{proj}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
transform PCs into the class 'proj'
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
proj(d1_PCs, d2_PCs, n_loadings = min(ncol(d1_PCs), ncol(d2_PCs)), proj_coords = matrix(0, nr = n_loadings), lengths = numeric(n_loadings), angles = if (n_loadings == 3) {
    numeric(3)
} else (numeric(1)), similarity = numeric(1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d1_PCs}{
%%     ~~Describe \code{d1_PCs} here~~
}
  \item{d2_PCs}{
%%     ~~Describe \code{d2_PCs} here~~
}
  \item{n_loadings}{
%%     ~~Describe \code{n_loadings} here~~
}
  \item{proj_coords}{
%%     ~~Describe \code{proj_coords} here~~
}
  \item{lengths}{
%%     ~~Describe \code{lengths} here~~
}
  \item{angles}{
%%     ~~Describe \code{angles} here~~
}
  \item{similarity}{
%%     ~~Describe \code{similarity} here~~
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
function (d1_PCs, d2_PCs, n_loadings = min(ncol(d1_PCs), ncol(d2_PCs)), 
    proj_coords = matrix(0, nr = n_loadings), lengths = numeric(n_loadings), 
    angles = if (n_loadings == 3) {
        numeric(3)
    } else (numeric(1)), similarity = numeric(1)) 
{
    if (!is.matrix(d1_PCs) | !is.matrix(d2_PCs)) 
        stop("principal components must be a matrix")
    if (!is.matrix(proj_coords)) 
        stop("projected coordinates must be a matrix")
    if (!is.numeric(lengths)) 
        stop("\"lengths\" must be numeric")
    if (!is.numeric(angles)) 
        stop("\"angles\" must be numeric")
    if (!is.numeric(similarity)) 
        stop("\"similarity\" must be numeric")
    if (ncol(d1_PCs) < 1 | ncol(d1_PCs) > 3) 
        stop("the number of PCs must between 1 and 3")
    if (ncol(d2_PCs) < 1 | ncol(d2_PCs) > 3) 
        stop("the number of PCs must between 1 and 3")
    if (nrow(proj_coords) != n_loadings) 
        stop("unmatched length of slot \"proj_coords\"")
    if (length(lengths) != n_loadings) 
        stop("unmatched length of slot \"lengths\"")
    if (n_loadings == 2 & length(angles) != 1) 
        stop("the number of angle must be 1")
    if (n_loadings == 3 & length(angles) != 3) 
        stop("the number of angles must be 3")
    if (length(similarity) != 1) 
        stop("\"similarity\" must be one number")
    d1_PCs <- as.matrix(d1_PCs[, 1:n_loadings])
    d2_PCs <- as.matrix(d2_PCs[, 1:n_loadings])
    new("proj", d1_PCs = d1_PCs, d2_PCs = d2_PCs, n_loadings = n_loadings, 
        proj_coords = proj_coords, lengths = lengths, angles = angles, 
        similarity = similarity)
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
