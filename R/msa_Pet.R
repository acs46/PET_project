library(msa)
library(seqinr)
library(ape)


system.file("tex", "texshade.sty", package="msa")

petSeqs <- readAAStringSet("PETase_seqs.fasta", format="fasta")

petAlign <- msa(petSeqs)
petAlignClustalWAlign <- msa(petSeqs, "ClustalW")
petAlignClustalOmegaAlign <- msa(petSeqs, "ClustalOmega")

print(petAlign, show="complete")

msaPrettyPrint(petAlign, output="pdf", showNames="none",
               showLogo="none", askForOverwrite=FALSE, verbose=FALSE)


#Phyogenetic Tree

petAln2 <- msaConvert(petAlign, type="seqinr::alignment")

d <- dist.alignment(petAln2, "identity") 
as.matrix(d)[2:5, "pdb|6EQD|A Chain A", drop=FALSE]

peTree <- nj(d)
plot(peTree, main="Phylogenetic Tree of PETa?ses")

# PrettyPrint

#msaPrettyPrint(petAlign, output="pdf", y=c(158, 239),
msaPrettyPrint(petAlign, output="pdf",
               subset=c(1:5), showNames="none", showLogo="top",
               logoColors="rasmol", shadingMode="similar",
               showLegend=FALSE, askForOverwrite=FALSE,
               file="petAlign3.pdf")


