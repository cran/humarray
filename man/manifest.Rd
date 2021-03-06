% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/humarray.R
\name{manifest}
\alias{manifest}
\title{Convert from chip/rs-ids to manifest chip ID labels}
\usage{
manifest(ids)
}
\arguments{
\item{ids}{character, either a list of rs-ids or chip-ids. chip ids are preferable as they
are unique, and rs.ids are not. Using this function is not recommended for rs.id lists that
might have entries that map to multiple chip ids, because entries other than the first will be 
ignored. For such cases, use 'rs.to.id(manifest=TRUE,multi.list=TRUE,...)'.}
}
\value{
A character vector of SNP chip-ids matching the manifest format.
}
\description{
Some SNP-ids aren't legal R row/column names. In order to match datafiles and store annotation
as objects, this package converts SNP-names to sanitized versions if necessary, that are
legal row/column names. This function converts from such 'legal' versions of the IDs back
to the proper names, as per the chip manifest document (or whatever is stored in the chip.id field
of the chip.support() object, accessible using chipId()).
}
\examples{
  test.ids <- c("imm_1_898835","rs61733845","rs115005664","rs114582555",
      "chr1_20131940","chr1_20133829","rs150992667","rs138231315","rs111577708","rs187104718")
  manifest(c("chr1_20131940","ccc_1_67429655_A_G"))
  manifest(test.ids)  # even when some are rs-id, still works
  data.frame(rs.id=test.ids,legal.id=rs.to.id(test.ids),manifest.id=manifest(test.ids))
}
\seealso{
\code{\link{id.to.rs}}, \code{\link{GENE.to.ENS}}, \code{\link{ENS.to.GENE}}
}
\author{
Nicholas Cooper \email{nick.cooper@cimr.cam.ac.uk}
}
