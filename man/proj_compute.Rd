\name{proj_compute}
\alias{proj_compute}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
to get the results of projection
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
proj_compute(proj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{proj}{
%%     ~~Describe \code{proj} here~~
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
function (proj) 
{
    if (!is.proj(proj)) 
        stop("input must be the class 'proj'")
    if (proj@n_loadings != 1 & proj@n_loadings != 2 & proj@n_loadings != 
        3) 
        stop("invalid dimensions")
    if (proj@n_loadings == 3) {
        proj@proj_coords <- proj_3d(proj@d1_PCs, proj@d2_PCs)
        p1 <- proj@proj_coords[1, ]
        p2 <- proj@proj_coords[2, ]
        p3 <- proj@proj_coords[3, ]
        proj@lengths <- c(p1_l = sqrt(sum(p1^2)), p2_l = sqrt(sum(p2^2)), 
            p3_l = sqrt(sum(p3^2)))
        proj@angles <- c(p1_p2_deg = REdaS::rad2deg(Morpho::angle.calc(p1, 
            p2)), p1_p3_deg = REdaS::rad2deg(Morpho::angle.calc(p1, 
            p3)), p2_p3_deg = REdaS::rad2deg(Morpho::angle.calc(p2, 
            p3)))
        proj@similarity <- abs(pracma::nthroot(det(t(proj_coords(proj))), 
            3))
    }
    else if (proj@n_loadings == 2) {
        proj@proj_coords <- proj_2d(proj@d1_PCs[, 1:2], proj@d2_PCs[, 
            1:2])
        p1 <- proj@proj_coords[1, ]
        p2 <- proj@proj_coords[2, ]
        proj@lengths <- c(p1_l = sqrt(sum(p1^2)), p2_l = sqrt(sum(p2^2)))
        proj@angles <- REdaS::rad2deg(Morpho::angle.calc(p1, 
            p2))
        proj@similarity <- as.numeric(sqrt(proj@lengths[1] * 
            proj@lengths[2] * sin(Morpho::angle.calc(p1, p2))))
    }
    else {
        proj@proj_coords <- proj_1d(proj@d1_PCs, proj@d2_PCs)
        p <- as.numeric(proj@proj_coords)
        proj@lengths <- c(p = p)
        proj@similarity <- p
    }
    proj
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
