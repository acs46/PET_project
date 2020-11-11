# msa package requires the LaTeX program for text graphics
# https://www.latex-project.org/get/
#   Windows https://miktex.org/download
#   MacOS http://www.tug.org/mactex/



if (!requireNamespace("BiocManager", quietly=TRUE))
install.packages("BiocManager")
BiocManager::install("msa")

library(msa)

# texshade.sty must be available to LaTeX system
system.file("tex", "texshade.sty", package="msa")


mySequenceFile <- system.file("examples", "exampleAA.fasta", package="msa")
mySequences <- readAAStringSet(mySequenceFile)
mySequences

myFirstAlignment <- msa(mySequences)
myFirstAlignment

print(myFirstAlignment, show="complete")
# requires installation LaTex - https://www.latex-project.org/get/

# getwd()  to show current directory
# setwd(dir) to set working environment to a new directory

msaPrettyPrint(myFirstAlignment, output="pdf", showNames="none",
showLogo="none", askForOverwrite=FALSE, verbose=FALSE)

browseVignettes("msa")


print(myFirstAlignment, show="complete")
msaPrettyPrint(myFirstAlignment, output="pdf", showNames="none",
showLogo="none", askForOverwrite=FALSE, verbose=FALSE)
myClustalWAlignment <- msa(mySequences, "ClustalW")
myClustalWAlignment
myClustalOmegaAlignment <- msa(mySequences, "ClustalOmega")
myClustalOmegaAlignment
myMuscleAlignment <- msa(mySequences, "Muscle")
myMuscleAlignment
myFirstAlignment


myFirstAlignment
myClustalOmegaAlignment
mySequences
myFirstAlignment <- msa(mySequences)
myFirstAlignment
print(myFirstAlignment, show="complete")
msaPrettyPrint(myFirstAlignment, output="pdf", showNames="none",
showLogo="none", askForOverwrite=FALSE, verbose=FALSE)
mySequences
mySequences[1]
print(mySequences[5], show="complete")
msaPrettyPrint(myFirstAlignment, y=c(164, 213), output="asis",
showNames="none", showLogo="none", askForOverwrite=FALSE)
mySequences
myFirstAlignment

msaPrettyPrint(myFirstAlignment, y=c(164, 213), output="pdf",
showNames="none", showLogo="top", askForOverwrite=TRUE)
# Chunk 1: AnyChunkName
msaPrettyPrint(myFirstAlignment, output="asis")
msaPrettyPrint(myFirstAlignment, output="pdf", y=c(164, 213),
subset=c(1:6), showNames="none", showLogo="none",
consensusColor="ColdHot", showLegend=FALSE,
shadingMode="similar", askForOverwrite=FALSE,
furtherCode=c("\\defconsensus{.}{lower}{upper}",
"\\showruler{1}{top}"))
msaPrettyPrint(myFirstAlignment, output="pdf", y=c(164, 213),
subset=c(1:6), showNames="left", showLogo="top",
consensusColor="ColdHot", showLegend=FALSE,
shadingMode="similar", askForOverwrite=FALSE,
furtherCode=c("\\defconsensus{.}{lower}{upper}",
"\\showruler{1}{top}"))
printSplitString <- function(x, width=getOption("width") - 1)
{
starts <- seq(from=1, to=nchar(x), by=width)
for (i in 1:length(starts))
cat(substr(x, starts[i], starts[i] + width - 1), "\n")
}
printSplitString(msaConsensusSequence(myFirstAlignment))
printSplitString(msaConsensusSequence(myFirstAlignment, type="upperlower",
thresh=c(40, 20)))
hemoSeq <- readAAStringSet(system.file("examples/HemoglobinAA.fasta",
package="msa"))
hemoAln <- msa(hemoSeq)
hemoAln

install.packages("seqinr")
library(seqinr)

hemoAln2 <- msaConvert(hemoAln, type="seqinr::alignment")

d <- dist.alignment(hemoAln2, "identity")
as.matrix(d)[2:5, "HBA1_Homo_sapiens", drop=FALSE]
 
install.packages("ape")
library("ape")

hemoTree <- nj(d)
plot(hemoTree, main="Phylogenetic Tree of Hemoglobin Alpha Sequences")
hemoAln3 <- msaConvert(hemoAln, type="bios2mds::align")
str(hemoAln3)
hemoAln4 <- as(hemoAln, "BStringSet")
hemoAln4
