\name{Rainfall}
\alias{Rainfall}
\title{Rainfall Plots}
\description{Plots the genomic position of a somatic cell mutation vs. the genomic distance between each mutation}
\usage{Rainfall(position, distance, cols = c("blue", "black", "orange", "purple", "yellow", "green"), mutations = c("C>A", "C>G", "C>T", "T>A", "T>C", "T>G"))}

\arguments{
  \item{position}{genomic position of the somatic cell mutation}
  \item{distance}{genomic distance between each mutation}
  \item{cols}{the color of the plot points for each type of mutation}
  \item{mutations}{C>A, C>G, C>T, T>A, T>C, T>G}
}

\references{}
\author{Emily Mulhern}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (position, distance, cols = c("blue", "black", "orange", 
    "purple", "yellow", "green"), mutations = c("C>A", "C>G", 
    "C>T", "T>A", "T>C", "T>G")) 
{
    dat <- data.frame(pos = runif(n, 0, 3e+09), mutation = sample(c("C>A", 
        "C>G", "C>T", "T>A", "T>C", "T>G"), size = n, replace = TRUE), 
        stringsAsFactors = FALSE)
    dat <- dat[order(dat$pos), ]
    position <- dat$pos
    n <- length(dat$pos)
    distance <- c(NA, dat$pos[-1] - dat$pos[-n])
    cols <- c("blue", "black", "orange", "purple", "yellow", 
        "green")
    names(cols) <- c("C>A", "C>G", "C>T", "T>A", "T>C", "T>G")
    plot(position, distance, xlab = "genomic position", ylab = "genomic distance", 
        col = cols[dat$mutation], pch = 16)
    legend(1.25e+09, 2500000, title = "Mutations", cex = 0.75, 
        pch = 16, col = c("blue", "black", "orange", "purple", 
            "yellow", "green"), legend = c("C>A", "C>G", "C>T", 
            "T>A", "T>C", "T>G"), ncol = 6)
    if (length(dat$pos) != length(dat$distance)) 
        warning("length of position does not equal length of distance")
  }
}



\keyword{hplot}

