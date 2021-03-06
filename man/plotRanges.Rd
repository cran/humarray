% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\name{plotRanges}
\alias{plotRanges}
\title{Plot the locations specified in a GRanges or RangedData object}
\usage{
plotRanges(ranged, labels = NULL, do.labs = T, skip.plot.new = F,
  lty = "solid", alt.y = NULL, v.lines = FALSE, ylim = NULL,
  xlim = NULL, scl = c("b", "Kb", "Mb", "Gb"), col = NULL, srt = 0,
  pos = 4, pch = 1, lwd = 1, cex = 1, ...)
}
\arguments{
\item{ranged}{GRanges or RangedData object with genomic ranges. Should only contain
one chromosome, but if not, the first will be used}

\item{labels}{by default labels for each range are taken from the rownames of 'ranged',
but if you want to use another column in the ranged object, specify the column name
or number to use to label these ranges on the plot. Or else input a character
vector the same length as ranged for custom labels.}

\item{do.labs}{logical, whether or not to display these labels}

\item{skip.plot.new}{logical, whether to append to an existing plot (TRUE), or start
a new plot (FALSE --> default)}

\item{lty}{line type to use, see '?lines()' - not used for SNP data when v.lines=FALSE}

\item{alt.y}{alternative y-axis values (other than the default ordering from the input)
This can be a vector of length 1 or length(ranged), or else a column name in ranged to 
take the values from}

\item{v.lines}{TRUE will plot the ranges as pairs of vertical lines, occupying the full
vertical extent of the plot, whereas FALSE will plot the ranges as individual horizontal lines}

\item{ylim}{numeric, length 2, the y-axis limits for the plot, same a 'ylim' for ?plot()}

\item{xlim}{numeric, length 2, the x-axis limits for the plot, same a 'xlim' for ?plot(),
This shouldn't usually be needed as the automatic x-limits should work well,
 however is here in case fine tuning is required.}

\item{scl}{character, the scale that the x axis uses, ie, 'b','kb','mb', or 'gb', meaning
base-pairs, kilobases, megabases or gigabase-pairs.}

\item{col}{character, colour, same as 'col' argument for plot(), etc.}

\item{srt}{integer, text rotation in degrees (see par) for labels}

\item{pos}{integer, values of '1', '2', '3' and '4', respectively indicate positions below, 
to the left of, above and to the right of the specified coordinates. See 'pos' in graphics:text()}

\item{pch}{point type, see '?points()' - not used for ranged data}

\item{lwd}{line width, see '?lines()' - not used for SNP data when v.lines=FALSE}

\item{cex}{font/symbol size, see '?plot()' - passed to plot, points if using SNP data}

\item{...}{further arguments to 'plot', so long as skip.plot.new==FALSE.}
}
\value{
Plots the ranges specified in 'ranged' to the current plot, or to a new plot
}
\description{
GRanges and RangedData objects are used in bioconductor to store genomic locations and
ranges, such as transcripts, genes, CNVs and SNPs. This function allows simple
plotting of this data directly from the ranged object. SNPs will be plotted as dots 
and ranges as lines. Either can be plotted using vertical bars at the start/end of each
range. There are options for labelling and other graphical parameters.
This package also creates a generic 'plot' method for GRanges and RangedData that
calls this function.
}
\examples{
require(GenomicRanges)
rr <- in.window(rranges(5000),chr=6,pos=c(28,32),unit="mb") # make some random MHC ranges
rownames(rr) <- paste0("range",1:length(rr))
# plotRanges vertically 
#print(rr)
plotRanges(rr,v.lines=TRUE)
# make some labels and plot as horizontal lines #
rr2 <- rr[1:5,]; mcols(rr2)[["GENE"]] <- c("CTLA9","HLA-Z","BS-1","FAKr","teST")
plotRanges(rr2,label="GENE",scl="Mb",col="black",
            xlab="Chr6 position (megabases)",
            yaxt="n",ylab="",bty="n")
# create some SNPs and plot
rr3 <- rr; end(rr3) <- start(rr3) 
rownames(rr3) <- paste0("rs",sample(10^6,nrow(rr3)))
plotRanges(rr3,col="blue",yaxt="n",ylab="",bty="n")
}
