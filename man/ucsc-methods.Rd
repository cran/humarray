% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\docType{methods}
\name{ucsc}
\alias{ucsc}
\alias{ucsc,ChipInfo-method}
\title{Retrieve the UCSC build for a ChipInfo object}
\usage{
ucsc(x)

\S4method{ucsc}{ChipInfo}(x)
}
\arguments{
\item{x}{a ChipInfo object}
}
\value{
character, 'hg18', 'hg19', or 'hg38'
}
\description{
Returns the UCSC build of the chip object, e.g, 'hg18', 'hg19', or 'hg38'
}
