% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\name{get.gene.annot}
\alias{get.gene.annot}
\title{Get human gene names and locations from biomart}
\usage{
get.gene.annot(dir = NULL, build = NULL, bioC = TRUE,
  duplicate.report = FALSE, one.to.one = FALSE, remap.extra = FALSE,
  discard.extra = TRUE, only.named = FALSE, ens.id = FALSE,
  refresh = FALSE, GRanges = TRUE, host.txt = "")
}
\arguments{
\item{dir}{character, location to store file with the gene annotation.
If NULL then getOption("save.annot.in.current")>=1 will result in
this file being stored in the current directory, or if <=0, then this file will not
be stored.}

\item{build}{string, currently 'hg18' or 'hg19' to specify which annotation version to use. 
Default is build-36/hg-18. Will also accept integers 36,37 as alternative arguments.}

\item{bioC}{logical, whether to return the annotation as a ranged S4 object (GRanges or
RangedData), or as a data.frame}

\item{duplicate.report}{logical, whether to provide a report on the genes labels that are listed
in more than 1 row - this is because some genes span ranges with substantial gaps within them}

\item{one.to.one}{logical, as per above, some genes have duplicate entries, sometimes for simplicity
you want just one range per gene, if this parameter is set TRUE, one range per gene is enforced,
and only the widest range will be kept by default for each unique gene label}

\item{remap.extra}{logical, whether to remap chromosome annotation for alternative builds and
unconnected segments to the closest regular chromosome, e.g, mapping MHC mappings to chromosome 6}

\item{discard.extra}{logical, similar to above, but if TRUE, then any non-standard chromosome
genes will just be discarded}

\item{only.named}{logical, biomart annotation contains some gene segments without names, if TRUE, then
such will not be included in the returned object (note that this will happen also if one.to.one is TRUE)}

\item{ens.id}{logical, whether to include the ensembl id in the dataframe}

\item{refresh}{logical, if you already have the file in the current directory,
this argument will let you re-download and re-generate this file, e.g, if the file
is modified or corrupted this will make a new one without having to manually delete it}

\item{GRanges}{logical, if TRUE and bioC is also TRUE, then returned object will be GRanges, otherwise
it will be RangedData}

\item{host.txt}{character, the argument to pass to biomaRt::useMart(). Default for build 36 is 
'may2009.archive.ensembl.org', and for build 37, "feb2014.archive.ensembl.org" but for recent builds
 the recommended link is 'www.ensembl.org'}
}
\value{
Returns a data.frame, GRanges or RangedData object, depending on input parameters. Contained
will be HGNC gene labels, chromosome and start and end positions, other information depends on 
specific parameters documented above
}
\description{
Various R packages assist in downloading genomic information but often the input required is 
complex, or several lines of code are required to initiate, returning an object that
might require some manipulation to be useful. This function simplifies the job 
considerably, not necessarily requiring any arguments. The object returned can be
a standard data.frame or a bioconductor GRanges/RangedData object. The raw annotation
file downloaded will be kept in the working directory so that subsequent calls to
this function run very quickly, and also allow use offline.
}
\examples{
\donttest{
setwd(tempdir())
get.gene.annot()
}
}
