% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\name{showChipInfo}
\alias{showChipInfo}
\title{Display a ChipInfo object}
\usage{
showChipInfo(x, margin = "", with.classinfo = FALSE,
  print.seqlengths = FALSE, ...)
}
\arguments{
\item{x}{a ChipInfo object}

\item{margin}{margin for display, usually ""}

\item{with.classinfo}{logical, whether to display class information}

\item{print.seqlengths}{logical, whether to display sequence lengths below
the main output listing (e.g, chromsomes). Usually tidier when this is FALSE.}

\item{...}{hidden arguments including: 'head.tail'; number of SNPs to display 
at start/end (only the head and tail are shown as these objects are generally
very large with >100K SNPs); 'up.to'; only SNPs at the start and end are generally
displayed, however this parameter specifies that when there are <= 'up.to' SNPs,
then all SNPs will be displayed; 'show.strand'; logical, by default the strand is 
hidden, particularly given that the strand can vary between different datasets 
of the same chip. Setting to TRUE will display the strand.}
}
\value{
print compact preview of the object to the standard output (terminal)
}
\description{
Returns a preview of a ChipInfo object to the console. This
is similar to a GRanges preview, but the seqlevels are hidden, the UCSC
build and chip name are displayed, start and end are merged to the virtual
label 'position' (as it's assume we are dealing with SNPs, not ranges), the strand
by default is hidden, and the integer codes for pass/fail in QCcodes() are 
displayed as 'pass' or 'fail', even though this is not how they are represented internally.
This is called by the default 'show' method for ChipInfo objects.
}
\seealso{
\code{\link{ChipInfo}}
}
