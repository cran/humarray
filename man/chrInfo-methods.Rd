% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\docType{methods}
\name{chrInfo,RangedData-method}
\alias{chrInfo,RangedData-method}
\title{Chromosome info method for ranged objects}
\usage{
\S4method{chrInfo}{RangedData}(object)
}
\arguments{
\item{object}{RangedData or GRanges object}
}
\value{
matrix of ranges, colnames start, stop, offset
}
\description{
Return the list of chromosome start and end ranges from a RangedData object
}
