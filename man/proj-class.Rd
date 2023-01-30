\name{proj-class}
\Rdversion{1.1}
\docType{class}
\alias{proj-class}
\alias{pair_boxplot,proj-method}
\alias{pair_correlation_plot,proj-method}
\alias{pair_density_plot,proj-method}
\alias{pair_vioplot,proj-method}
\alias{plot_1d,proj-method}
\alias{plot_2d,proj-method}
\alias{plot_3d,proj-method}
\alias{proj_plot,proj-method}
\alias{show,proj-method}
\alias{venn_plot,proj-method}

\title{Class \code{"proj"}}
\description{
Class \code{"proj"} contains the information of projection.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("proj", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{d1_PCs}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{d2_PCs}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{n_loadings}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{proj_coords}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{lengths}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{angles}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{similarity}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{pair_boxplot}{\code{signature(obj = "proj")}: ... }
    \item{pair_correlation_plot}{\code{signature(obj = "proj")}: ... }
    \item{pair_density_plot}{\code{signature(obj = "proj")}: ... }
    \item{pair_vioplot}{\code{signature(obj = "proj")}: ... }
    \item{plot_1d}{\code{signature(obj = "proj")}: ... }
    \item{plot_2d}{\code{signature(obj = "proj")}: ... }
    \item{plot_3d}{\code{signature(obj = "proj")}: ... }
    \item{proj_plot}{\code{signature(obj = "proj")}: ... }
    \item{show}{\code{signature(object = "proj")}: ... }
    \item{venn_plot}{\code{signature(obj = "proj")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("proj")
}
\keyword{classes}
