#!/Applications/Anaconda/anaconda/bin/python3

from Bio import AlignIO

alignments = list(AlignIO.parse(open("sequences/cobaltAlign_smart_blastPetase_related_seqs.txt"), "fasta"))
#alignment = AlignIO.parse(open("sequences/cobaltAlign_smart_blastPetase_related_seqs.txt"), "fasta")

print(alignments)

#for record in alignment:
#    print("%s - %s" % (record.seq, record.id))

for record in alignments :
    print(record)
    print("")

#for alignment in AlignIO.parse(handle, "fasta", seq_count=2):
#    print("Alignment length %i" % alignment.get_alignment_length())
#    for record in alignment:
#        print("%s - %s" % (record.seq, record.id))
#    print("")



