% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kmerFrequenciesToMarkov.R
\name{kmerFrequenciesToMarkov}
\alias{kmerFrequenciesToMarkov}
\title{Compute the parameters of a Markov model (transition matrix) from k-mer occurrences}
\usage{
kmerFrequenciesToMarkov(kmer.seq, kmer.occ, alphabet = c("A", "C", "G", "T"))
}
\arguments{
\item{kmer.seq}{A vector of k-mer sequences.}

\item{kmer.occ}{A vector of the same length as seq.}

\item{alphabet}{Exhaustive list of residues to take in consideration as suffixes for the transition matrix.}
}
\value{
A list with the parameters of the model (k, m) + the transition matrix.
}
\description{
Compute a transition matrix from a list of k-mer occurrences.
}
\details{
First version: 2003-09
Last modification: 2015-02
}
\examples{

## Compute Markov model from dinucleotide occurrences measures in Escherichia coli genome
org <- "Escherichia_coli_K12"
k <- 3
freq.file.path <- file.path("markov_models", org, paste(sep="", k, "nt_genomic_",org,"-1str-ovlp.freq.gz"))
freq.file <- system.file("extdata", freq.file.path, package = "stats4bioinfo")
message("Loading k-mer frequency file", freq.file)
freq.table <- read.delim(freq.file, row.names = 1, comment.char=";")
head(freq.table)
tail(freq.table)
markov.model <- kmerFrequenciesToMarkov(
    kmer.seq = freq.table$id, 
    kmer.occ = freq.table$occ)
transitions <- markov.model[["transition"]]
heatmap.simple(round(digits=3, as.matrix(transitions)),main=org, zlim=c(0,1))

}
\author{
Jacques van Helden (\email{Jacques.van-Helden@univ-amu.fr})
}

